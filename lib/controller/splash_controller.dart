import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:my_doctor/const/routes/routes_names.dart';

class SplashController extends GetxController {
  double viewOpacity = 0.0;

  changeOpacity() {
    viewOpacity = 1.0;
    update();
  }

  goToWelcomeScreen() {
    Get.toNamed(AppRoutesNames.welcomePage);
  }

  goToLoginScreen() {
    Get.offAllNamed(AppRoutesNames.loginScreen);
  }

  goToSignUpScreen() {
    Get.offAllNamed(AppRoutesNames.signupScreen);
  }

  @override
  void onReady() {
    changeOpacity();
    super.onInit();
  }
}
