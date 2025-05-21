import 'package:flutter/material.dart';
import 'package:my_doctor/const/app_theme/app_theme.dart';
import 'package:my_doctor/const/routes/routes.dart';
import 'package:my_doctor/view/intro_screens/splash_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
      routes: routes,
    );
  }
}
