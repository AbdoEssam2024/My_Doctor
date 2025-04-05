import 'package:get/get.dart';

import 'package:my_doctor/const/routes/routes_names.dart';
import 'package:my_doctor/main.dart';

class SplashController extends GetxController {
  goToWelcomeScreen() async {
    sharedPreferences.setInt("visit", 0);
    Get.toNamed(AppRoutesNames.welcomePage);
  }

  goToLoginScreen() {
    Get.offAllNamed(AppRoutesNames.loginScreen);
    sharedPreferences.setInt("visit", 1);
  }

  goToSignUpScreen() {
    Get.offAllNamed(AppRoutesNames.signupScreen);
    sharedPreferences.setInt("visit", 1);
  }
}
