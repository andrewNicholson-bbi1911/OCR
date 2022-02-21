import 'package:dartz/dartz.dart';
import 'package:tesseract/Core/Failures/failure.dart';

abstract class UseCase<Type, Params>{
  Future<Either<Failure, Type>> call(Params params);
}