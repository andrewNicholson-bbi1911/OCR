import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tesseract/Feature/Presentation/GettingDatatronResponse_cubit/getting_datatron_response_cubit.dart';
import 'package:tesseract/Feature/Presentation/Recognition_cubit/recognition_cubit.dart';

abstract class Failure{
  final String message;
  Failure({this.message = "something went wrong"})
  {
    print(message);
  }

  void exit(BuildContext context);
}

class RecognitionFailure extends Failure{

  RecognitionFailure({String message = "something went wrong during recognition"})
      : super(message: message);

  @override
  void exit(BuildContext context) {
    BlocProvider.of<RecognitionCubit>(context).backToSellecting();
  }
}

abstract class DatatronRequestFailure extends Failure{
  DatatronRequestFailure(String message)
      : super(message: message);

  @override
  void exit(BuildContext context) {
    if(Navigator.canPop(context)) {
      BlocProvider.of<GettingDatatronResponseCubit>(context).backToRequestBuild();
      Navigator.pop(context);
    }
  }
}

class DatatronEmptyResponseFailure extends DatatronRequestFailure{

  final String sentRequest;

  DatatronEmptyResponseFailure(this.sentRequest) : super("no data found for [$sentRequest'] request");

}

class DatatronOtherRequestFailure extends DatatronRequestFailure{
  DatatronOtherRequestFailure({String message = "something went wrong during "
      "getting Datatron data"}) : super(message);
}

class DatatronEmptyRequestFailure extends DatatronRequestFailure{
  DatatronEmptyRequestFailure() : super("request for cube is empty");
}

class DatatronInappropriateResponseFailure extends DatatronRequestFailure{
  DatatronInappropriateResponseFailure() : super("response is empty or inappropriate");
}

class DatatronReportDataIsEmptyFailure extends DatatronRequestFailure{
  DatatronReportDataIsEmptyFailure() : super("Report data is empty");
}

class DatatronUnableToBuildReportLinkFailure extends DatatronRequestFailure{
  String response;
  DatatronUnableToBuildReportLinkFailure(this.response) : super("Unable to build reportLink for $response");
}