import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:my_doctor/const/class/middleware.dart';
import 'package:my_doctor/const/routes/routes_names.dart';
import 'package:my_doctor/view/screen/auth_screens/forget_password.dart';
import 'package:my_doctor/view/screen/auth_screens/reset_password.dart';
import 'package:my_doctor/view/screen/auth_screens/success_signup.dart';
import 'package:my_doctor/view/screen/auth_screens/verify_email.dart';
import 'package:my_doctor/view/screen/auth_screens/verify_reset_pw.dart';
import 'package:my_doctor/view/screen/home_screen/home_page.dart';
import 'package:my_doctor/view/screen/auth_screens/login_screen.dart';
import 'package:my_doctor/view/screen/auth_screens/signup_screen.dart';
import 'package:my_doctor/view/screen/intro_screens/splash_screen.dart';
import 'package:my_doctor/view/screen/intro_screens/welcome_screen.dart';
/// This file defines the application's route configuration using the GetX package.
/// 
/// It imports necessary screens and middleware, and sets up a list of `GetPage`
/// objects, each representing a route in the application. Each route is associated
/// with a specific screen and, optionally, middleware for handling route-specific
/// logic.
/// 
/// The routes include:
/// - SplashScreen with middleware for initial loading.
/// - WelcomeScreen for welcoming users.
/// - LoginScreen for user authentication.
/// - SignupScreen for new user registration.
/// - HomePage as the main application screen.
/// - VerifyEmail for email verification during signup.
/// - SuccessSignup to indicate successful registration.
/// - ForgetPassword for password recovery initiation.
/// - VerifyResetPw for verifying password reset requests.
/// - ResetPassword for setting a new password after verification.
List<GetPage<dynamic>> routes = [
  GetPage(
    name: AppRoutesNames.splashScreen,
    page: () => SplashScreen(),
    middlewares: [SplashMiddleware()],
  ),
  GetPage(name: AppRoutesNames.welcomePage, page: () => WelcomeScreen()),
  GetPage(name: AppRoutesNames.loginScreen, page: () => LoginScreen()),
  GetPage(name: AppRoutesNames.signupScreen, page: () => SignupScreen()),
  GetPage(name: AppRoutesNames.homeScreen, page: () => HomePage()),
  GetPage(name: AppRoutesNames.verifyEmailScreen, page: () => VerifyEmail()),
  GetPage(name: AppRoutesNames.successSignUp, page: () => SuccessSignup()),
  GetPage(
    name: AppRoutesNames.forgotPasswordScreen,
    page: () => ForgetPassword(),
  ),
  GetPage(
    name: AppRoutesNames.verifyResetPwScreen,
    page: () => VerifyResetPw(),
  ),
  GetPage(name: AppRoutesNames.resetPassword, page: () => ResetPassword()),
];