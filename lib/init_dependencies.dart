import 'package:blog_learn_2/feature/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:blog_learn_2/feature/auth/data/repository/auth_repository_impl.dart';
import 'package:blog_learn_2/feature/auth/domain/repository/auth_repository.dart';
import 'package:blog_learn_2/feature/auth/domain/usecases/user_signup_usecase.dart';
import 'package:blog_learn_2/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/secrets/superbase_secrets.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies () async {
  _initAuth();
  final supabase = await Supabase.initialize(
      url: SuperBaseSecrets.supabaseUrl,
      anonKey: SuperBaseSecrets.supabaseAnonKey
  );
  serviceLocator.registerLazySingleton(() => supabase.client);
}

void  _initAuth() {
  serviceLocator.registerFactory<AuthRemoteDataSource>(
          () => AuthRemoteDataSourceImpl(
              serviceLocator()
          ));

  serviceLocator.registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(
        serviceLocator()
      )
  );

  serviceLocator.registerFactory<UserSignup>(
      () => UserSignup(
        serviceLocator()
      )
  );

  serviceLocator.registerLazySingleton<AuthBloc>(
      () => AuthBloc(
          userSignup: serviceLocator()
      )
  );
}
