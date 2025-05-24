import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_doctor/const/routes/routes_names.dart';
import 'package:my_doctor/controller/login_controller/login_cubit.dart';
import 'package:my_doctor/controller/signup_controller/signup_cubit.dart';
import 'package:my_doctor/view/auth_screens/login_screen/login_screen.dart';
import 'package:my_doctor/view/auth_screens/reset_password/reset_password_screen.dart';
import 'package:my_doctor/view/auth_screens/signup_screen/signup_screen.dart';
import 'package:my_doctor/view/home_screen/home_screen.dart';
import 'package:my_doctor/view/intro_screens/splash_screen.dart';
import 'package:my_doctor/view/intro_screens/welcome_screen.dart';

Route<dynamic>? Function(RouteSettings)? onGenerateRoute = (settings) {
  switch (settings.name) {
    case AppRoutesNames.splashScreen:
      return fadeAnimatedRoute(const SplashScreen());
    case AppRoutesNames.welcomeScreen:
      return fadeAnimatedRoute(const WelcomeScreen());
    case AppRoutesNames.loginScreen:
      return fadeAnimatedRoute(
        BlocProvider(
          create: (context) => LoginCubit(),
          child: const LoginScreen(),
        ),
      );
    case AppRoutesNames.signupScreen:
      return slideAnimatedRoute(
        BlocProvider(
          create: (context) => SignupCubit(),
          child: const SignupScreen(),
        ),
      );
    case AppRoutesNames.homeScreen:
      return fadeAnimatedRoute(const HomeScreen());
    case AppRoutesNames.resetPasswordScreen:
      return fadeAnimatedRoute(
          ResetPasswordScreen(email: settings.arguments as String));

    default:
      return fadeAnimatedRoute(const SplashScreen());
  }
};

PageRouteBuilder slideAnimatedRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    },
    transitionDuration: const Duration(milliseconds: 500),
  );
}


PageRouteBuilder fadeAnimatedRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        alwaysIncludeSemantics: true,
        opacity: animation,
        child: child,
      );
    },
    transitionDuration: const Duration(milliseconds: 500),
  );
}