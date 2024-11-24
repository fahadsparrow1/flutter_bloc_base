import 'package:blog_learn_2/feature/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:blog_learn_2/feature/auth/data/repository/auth_repository_impl.dart';
import 'package:blog_learn_2/feature/auth/domain/usecases/user_signup_usecase.dart';
import 'package:blog_learn_2/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/secrets/superbase_secrets.dart';
import 'core/theme/theme.dart';
import 'feature/auth/presentation/pages/login_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final supabase = await Supabase.initialize(
      url: SuperBaseSecrets.supabaseUrl,
      anonKey: SuperBaseSecrets.supabaseAnonKey
  );
  runApp( MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => AuthBloc(
          userSignup: UserSignup(AuthRepositoryImpl(AuthRemoteDataSourceImpl(supabase.client)))
      ))
    ],
    child: MyApp()
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blog app',
      theme: AppTheme.darkThemeMode,
      home: LoginPage(),
    );
  }
}
