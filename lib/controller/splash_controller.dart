import 'package:get/get.dart';
import 'package:my_doctor/const/routes/routes_names.dart';
import 'package:my_doctor/main.dart';

class SplashController extends GetxController {


  goToWelcomeScreen() async {
    userDataBox.put("visit", 0);
    Get.toNamed(AppRoutesNames.welcomePage);
  }

  goToLoginScreen() {
    Get.offAllNamed(AppRoutesNames.loginScreen);
    userDataBox.put("visit", 1);
  }

  goToSignUpScreen() {
    Get.offAllNamed(AppRoutesNames.signupScreen);
    userDataBox.put("visit", 1);
  }
}
