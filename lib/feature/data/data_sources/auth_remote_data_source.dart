import 'dart:io';

import 'package:blog_learn_2/core/error/exception.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> signupWithEmailPassword ({
    required String name,
    required String email,
    required String password
  });
  Future<String> loginWithEmailPassword ({
    required String email,
    required String password
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;
  AuthRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<String> loginWithEmailPassword({required String email, required String password}) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<String> signupWithEmailPassword({
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
      return res.session!.user.id;
    } catch(e) {
      throw ServerException(e.toString());
    }
  }
  
}