import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_doctor/const/class/internet_service.dart';
import 'package:my_doctor/const/class/request_state.dart';
import 'package:my_doctor/const/colors/app_colors.dart';
import 'package:my_doctor/const/routes/routes_names.dart';
import 'package:my_doctor/repo/auth_repo/signup_data.dart';
import 'package:my_doctor/view/core_widgets/custom_snack_bar.dart';

class SignupController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController fullNameController;
  late TextEditingController mobileController;
  late TextEditingController birthController;
  late TextEditingController genderController;
  String selectedGender = "Male";
  RxBool showPass = true.obs;

  GlobalKey<FormState> signUpformKey = GlobalKey<FormState>();
  Rx<RequestState> requestState = RequestState.none.obs;

  SignUpUserData signUpUser = SignUpUserData(apiCalls: Get.find());

  signUpFunc() async {
    if (signUpformKey.currentState!.validate()) {
      listenToNetworkChanges();
      if (requestState.value == RequestState.online) {
        requestState.value = RequestState.loading;
        var response = await signUpUser.signUpUserData(
          username: fullNameController.text,
          usermobile: mobileController.text,
          userbirth: birthController.text,
          usergender: selectedGender,
          email: emailController.text,
          password: passwordController.text,
        );

        if (response is RequestState) {
          requestState.value = response;
        } else {
          if (response['status'] == "success") {
            requestState.value = RequestState.success;
            snackBarWidget(
              title: 'Success',
              message: "Your Account Created Successfully",
              backgroundColor: AppColors.mediumBlueColor,
            );
            Get.offNamed(
              AppRoutesNames.verifyEmailScreen,
              arguments: {'email': emailController.text},
            );
          } else {
            requestState.value = RequestState.success;
            snackBarWidget(
              title: response['status'],
              message: response['message'],
              backgroundColor: AppColors.redColor,
            );
          }
        }
      } else {
        snackBarWidget(
          title: 'Error',
          message: 'You are offline. Please check your internet connection.',
        );
      }
    }
    update();
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
    showPass.value = !showPass.value;
  }

  goToLoginScreen() {
    Get.offNamed(AppRoutesNames.loginScreen);
  }

  listenToNetworkChanges() {
    ever(InternetService.requestState, (state) {
      requestState.value = state;
      update();
    });
    requestState.value = InternetService.requestState.value;
  }

  initControllers() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    fullNameController = TextEditingController();
    mobileController = TextEditingController();
    birthController = TextEditingController();
    genderController = TextEditingController();
    listenToNetworkChanges();
  }

  disposeControllers() {
    emailController.dispose();
    passwordController.dispose();
    fullNameController.dispose();
    mobileController.dispose();
    birthController.dispose();
    genderController.dispose();
    super.onClose(); // Added super.onClose() to ensure proper cleanup
  }

  @override
  void onInit() {
    initControllers();
    super.onInit();
  }

  @override
  void onClose() {
    disposeControllers();
    super.onClose();
  }
}
