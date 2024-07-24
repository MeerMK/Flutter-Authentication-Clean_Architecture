import 'package:demo_app/core/theme/theme.dart';
import 'package:demo_app/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E360',
      theme: AppTheme.darkThememode,
      home: const LoginPage(),
    );
  }
}
