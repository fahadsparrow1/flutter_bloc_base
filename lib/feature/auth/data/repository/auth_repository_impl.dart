import 'package:blog_learn_2/core/error/exception.dart';
import 'package:blog_learn_2/core/error/failure.dart';
import 'package:fpdart/src/either.dart';
import '../../domain/entity/user.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_sources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl(this.authRemoteDataSource);

  @override
  Future<Either<Failure, User>> loginWithEmailPassword({
    required String email,
    required String password
  }) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> signupWithEmailPassword({
    required String name,
    required String email,
    required String password
  }) async {
   try {
    final user = await authRemoteDataSource.signupWithEmailPassword(name: name, email: email, password: password);
    return right(user);
   } on ServerException catch(e) {
     return left(Failure(e.message));
   }
  }

}