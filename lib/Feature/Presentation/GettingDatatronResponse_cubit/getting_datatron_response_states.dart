import 'package:tesseract/Core/Failures/failure.dart';
import 'package:tesseract/Core/UseCase/usecase.dart';
import 'package:tesseract/Feature/Domain/Entities/datatron_raw_response_entity.dart';

abstract class GettingDatatronResponseState{
  GettingDatatronResponseState();
}

///начальное состояние
class GDREmptyState extends GettingDatatronResponseState{
  GDREmptyState() : super();
}

///данные загружаются
class GDRLoadingState extends GettingDatatronResponseState{

  GDRLoadingState() : super();

}

///данные загружены и они представляются
class GDRPresentingState extends GettingDatatronResponseState{

  final DatatronRawResponseEntity response;

  GDRPresentingState(this.response) : super ();

}

///во время загрузки произошла ошибка
class GDRFailureState extends GettingDatatronResponseState{

  final DatatronRequestFailure failure;

  GDRFailureState(this.failure) : super();

}

