import 'dart:async';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tesseract/Feature/Presentation/GettingDatatronResponse_cubit/getting_datatron_response_cubit.dart';
import 'package:tesseract/Feature/Presentation/Recognition_cubit/recognition_cubit.dart';
import 'package:tesseract/locator_service.dart' as di;
import 'package:tesseract/locator_service.dart';
import 'Feature/Presentation/Pages/picture_recognition_stage_main.dart';


late List<CameraDescription> cameras;

Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  cameras = await availableCameras();

  runApp( FeatureApp());
}


class FeatureApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RecognitionCubit>(create: (context) => sl<RecognitionCubit>()),
        BlocProvider<GettingDatatronResponseCubit>(create: (context) => sl<GettingDatatronResponseCubit>())
      ],
      child: MaterialApp(
        home: PictureRecognitionMain(),
      ),
    );
  }
}