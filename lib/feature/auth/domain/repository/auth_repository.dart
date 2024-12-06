import 'package:blog_learn_2/core/error/failure.dart';
import 'package:blog_learn_2/feature/auth/domain/entity/user.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, User>>signupWithEmailPassword({
    required String name,
    required String email,
    required String password
});
  Future<Either<Failure, User>>loginWithEmailPassword({
    required String email,
    required String password
  });
}