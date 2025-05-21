import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_doctor/const/routes/routes_names.dart';
import 'package:my_doctor/controller/login_controller/login_cubit.dart';
import 'package:my_doctor/controller/signup_controller/signup_cubit.dart';
import 'package:my_doctor/view/auth_screens/login_screen/login_screen.dart';
import 'package:my_doctor/view/auth_screens/signup_screen/signup_screen.dart';
import 'package:my_doctor/view/home_screen/home_screen.dart';
import 'package:my_doctor/view/intro_screens/splash_screen.dart';
import 'package:my_doctor/view/intro_screens/welcome_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoutesNames.splashScreen: (context) => const SplashScreen(),

  AppRoutesNames.welcomeScreen: (context) => const WelcomeScreen(),
  AppRoutesNames.loginScreen:
      (context) => BlocProvider(
        create: (context) => LoginCubit(),
        child: const LoginScreen(),
      ),
  AppRoutesNames.signupScreen:
      (context) => BlocProvider(
        create: (context) => SignupCubit(),
        child: const SignupScreen(),
      ),
  AppRoutesNames.homeScreen: (context) => const HomeScreen(),
};
