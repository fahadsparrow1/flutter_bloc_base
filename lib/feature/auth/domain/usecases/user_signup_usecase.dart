import 'package:blog_learn_2/core/error/failure.dart';
import 'package:blog_learn_2/core/usecase/usecase.dart';
import 'package:fpdart/fpdart.dart';
import '../repository/auth_repository.dart';

class UserSignup implements UseCase<String, UserSignupParams> {
  final AuthRepository authRepository;
  const UserSignup (this.authRepository);
  @override
  Future<Either<Failure, String>> call(params) async{
    return await authRepository.signupWithEmailPassword(
        name: params.name,
        email: params.email,
        password: params.password
    );
  }

}

class UserSignupParams {
  final String email;
  final String name;
  final String password;

  UserSignupParams({
    required this.email,
    required this.name,
    required this.password
  });
}