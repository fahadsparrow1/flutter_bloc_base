import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/secrets/superbase_secrets.dart';
import 'core/theme/theme.dart';
import 'feature/auth/presentation/pages/login_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: SuperBaseSecrets.supabaseUrl,
      anonKey: SuperBaseSecrets.supabaseAnonKey
  );
  runApp( MyApp(),);
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
