import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:my_doctor/const/routes/routes_names.dart';
import 'package:my_doctor/view/screen/home_page.dart';
import 'package:my_doctor/view/screen/login_screen.dart';
import 'package:my_doctor/view/screen/signup_screen.dart';
import 'package:my_doctor/view/screen/splash_screen.dart';
import 'package:my_doctor/view/screen/welcome_screen.dart';

List<GetPage<dynamic>> routes = [
  GetPage(name: AppRoutesNames.splashScreen, page: () => SplashScreen()),
  GetPage(name: AppRoutesNames.welcomePage, page: () => WelcomeScreen()),
  GetPage(name: AppRoutesNames.loginScreen, page: () => LoginScreen()),
  GetPage(name: AppRoutesNames.signupScreen, page: () => SignupScreen()),
  GetPage(name: AppRoutesNames.homeScreen, page: () => HomePage()),
];
