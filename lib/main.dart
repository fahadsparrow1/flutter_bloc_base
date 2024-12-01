import 'package:blog_learn_2/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:blog_learn_2/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/theme/theme.dart';
import 'feature/auth/presentation/pages/login_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp( MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => serviceLocator<AuthBloc>())
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
