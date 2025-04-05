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