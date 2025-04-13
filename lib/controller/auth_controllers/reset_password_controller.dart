import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_doctor/const/class/internet_service.dart';
import 'package:my_doctor/const/class/request_state.dart';
import 'package:my_doctor/const/colors/app_colors.dart';
import 'package:my_doctor/const/routes/routes_names.dart';
import 'package:my_doctor/repo/remote_data/auth_repo/reset_password_data.dart';
import 'package:my_doctor/view/core_widgets/custom_snack_bar.dart';

class ResetPwController extends GetxController {
  String email = "";
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  RxBool showPass = false.obs;
  ResetPasswordData resetPasswordData = ResetPasswordData(apiCalls: Get.find());
  Rx<RequestState> requestState = RequestState.none.obs;

  void toggleShowPass() {
    showPass.value = !showPass.value;
  }

  void goToSuccessPage() async {
    if (formKey.currentState!.validate()) {
      if (passwordController.text == confirmPasswordController.text) {
        listenToNetworkChanges();
        if (requestState.value == RequestState.online) {
          requestState.value = RequestState.loading;
          var response = await resetPasswordData.resetUserPassword(
            email: email,
            password: passwordController.text,
          );
          if (response is RequestState) {
            requestState.value = response;
          } else {
            if (response['status'] == "success") {
              requestState.value = RequestState.success;
              snackBarWidget(
                title: 'Success',
                message: "Your Password Reset Successfully",
                backgroundColor: AppColors.mediumBlueColor,
              );
              Get.offAllNamed(
                AppRoutesNames.successSignUp,
                arguments: {
                  "message": "Your Password has been reset successfully.",
                },
              );
            } else {
              requestState.value = RequestState.success;
              snackBarWidget(
                title: response['status'],
                message: "Failed To Reset Password , Please Try Again Later",
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
      } else {
        snackBarWidget(
          title: "Password Error",
          message: "Password Don't Match",
          backgroundColor: AppColors.redColor,
        );
      }
    }
  }

  void listenToNetworkChanges() {
    ever(InternetService.requestState, (state) {
      requestState.value = state;
      update();
    });
    requestState.value = InternetService.requestState.value;
  }

  initActions() {
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    email = Get.arguments['email'] ?? "";
    listenToNetworkChanges();
  }

  void disposeActions() {
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    initActions();
  }

  @override
  void onClose() {
    disposeActions();
    super.onClose();
  }
}
