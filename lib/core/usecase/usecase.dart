import 'package:blog_learn_2/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class UseCase<SuccessType, Params> {
  Future<Either<Failure,SuccessType>> call (Params params);
}