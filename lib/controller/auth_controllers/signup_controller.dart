import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:my_doctor/const/routes/routes_names.dart';

class SignupController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController fullNameController;
  late TextEditingController mobileController;
  late TextEditingController birthController;
  bool showPass = true;

  GlobalKey<FormState> signUpformKey = GlobalKey<FormState>();

  signUpFunc() {
    if (signUpformKey.currentState!.validate()) {
      Get.offNamed(AppRoutesNames.loginScreen);
    }
  }

  Future<void> pickDate(
    BuildContext context,
    TextEditingController controller,
  ) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      controller.text =
          "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
    }
  }

  toggleShowPass() {
    showPass = !showPass;
    update();
  }

  goToLoginScreen() {
    Get.offNamed(AppRoutesNames.loginScreen);
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    fullNameController = TextEditingController();
    mobileController = TextEditingController();
    birthController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    fullNameController.dispose();
    mobileController.dispose();
    birthController.dispose();
    super.onInit();
  }
}
