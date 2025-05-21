import 'package:flutter/material.dart';
import 'package:my_doctor/const/routes/routes_names.dart';
import 'package:my_doctor/view/intro_screens/splash_screen.dart';
import 'package:my_doctor/view/intro_screens/welcome_screen.dart';


Map<String, Widget Function(BuildContext)> routes = {
  AppRoutesNames.splashScreen: (context) => const SplashScreen(),
  AppRoutesNames.welcomeScreen: (context) => const WelcomeScreen(),
};