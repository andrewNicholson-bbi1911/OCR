import 'package:camera/camera.dart';
import 'package:get_it/get_it.dart';
import 'package:tesseract/Feature/Data/Repositories/datatron_answers_repository_impl.dart';
import 'package:tesseract/Feature/Data/Repositories/recognition_repository_impl.dart';
import 'package:tesseract/Feature/Data/Sources/datatron_data_source.dart';
import 'package:tesseract/Feature/Data/Sources/local_image_recognizing_source.dart';
import 'package:tesseract/Feature/Domain/Repositories/recognition_repository.dart';
import 'package:tesseract/Feature/Domain/Repositories/datatron_answers_repository.dart';
import 'package:tesseract/Feature/Domain/UseCases/get_datatron_responses.dart';
import 'package:tesseract/Feature/Presentation/GettingDatatronResponse_cubit/getting_datatron_response_cubit.dart';
import 'package:tesseract/Feature/Presentation/Recognition_cubit/recognition_cubit.dart';

import 'Feature/Domain/UseCases/recognize_image.dart';

final sl = GetIt.instance;

Future<void> init() async{
  //Cubit
  sl.registerFactory(() => RecognitionCubit(sl()));
  sl.registerFactory(() => GettingDatatronResponseCubit(sl()));

  print('Cubit loaded');
  //UseCases
  sl.registerLazySingleton(() => RecognizeImage(sl()));
  sl.registerLazySingleton(() => GetAllDatatronAnswers(sl()));

  print('UseCases loaded');
  //Repositories and sources
  sl.registerLazySingleton<ImageRecognitionRepository>(() => ImageRecognitionRepositoryImpl(sl()));
  sl.registerLazySingleton<DatatronAnswersRepository>(() => DatatronAnswersRepositoryImpl(sl()));

  sl.registerLazySingleton<LocalImageRecognizingSource>(() => TesseractLocalImageRecognizingSource());
  sl.registerLazySingleton<DatatronDataSource>(() => DatatronDataSourceImpl());

  print('repositories loaded');
  //Core
  //пока ничего

  print('Core loaded');
  //External
  //пока ничего

  print('Externals loaded');

}