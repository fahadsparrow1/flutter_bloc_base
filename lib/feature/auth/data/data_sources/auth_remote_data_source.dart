import 'dart:io';

import 'package:blog_learn_2/core/error/exception.dart';
import 'package:blog_learn_2/feature/auth/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> signupWithEmailPassword ({
    required String name,
    required String email,
    required String password
  });
  Future<UserModel> loginWithEmailPassword ({
    required String email,
    required String password
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;
  AuthRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<UserModel> loginWithEmailPassword({required String email, required String password}) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<UserModel> signupWithEmailPassword({
    required String name,
    required String email,
    required String password
  }) async {
    try {
      final res = await supabaseClient.auth.signUp(
          password: password,
          email: email,
          data: {
            'name': name
          }
      );
      if (res.user == null) {
        throw const ServerException('User is unknown');
      }
      return UserModel.fromJson(res.user!.toJson());
    } catch(e) {
      throw ServerException(e.toString());
    }
  }
  
}