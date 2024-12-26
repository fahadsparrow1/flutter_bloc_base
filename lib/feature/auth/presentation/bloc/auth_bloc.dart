import 'package:blog_learn_2/feature/auth/domain/entity/user.dart';
import 'package:blog_learn_2/feature/auth/domain/usecases/user_signup_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignup _userSignup;

  AuthBloc({
    required UserSignup userSignup,
  })  : _userSignup = userSignup,
        super(AuthInitial()) {
    on<AuthSignupEvent>((event, emit) async {
      emit(AuthLoading());
      final res = await _userSignup(
          UserSignupParams(
          email: event.email,
              name: event.name,
              password: event.password
          ));
      res.fold((l) => emit(
          AuthFailure(l.message)),
              (user) => emit(
                  AuthSuccess(user)
              )
      );
    });
  }
}
