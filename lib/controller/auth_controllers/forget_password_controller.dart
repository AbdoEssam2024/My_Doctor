import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_doctor/const/class/internet_service.dart';
import 'package:my_doctor/const/class/request_state.dart';
import 'package:my_doctor/const/colors/app_colors.dart';
import 'package:my_doctor/const/routes/routes_names.dart';
import 'package:my_doctor/repo/remote_data/auth_repo/change_code.dart';
import 'package:my_doctor/view/core_widgets/custom_snack_bar.dart';

/// A controller for handling the forget password functionality.
///
/// This controller manages the state and logic for sending a verification
/// code to the user's email for password reset. It listens to network
/// changes and updates the request state accordingly. The controller
/// validates the email input, sends a request to change the verification
/// code, and navigates to the verification screen upon success. It also
/// displays appropriate snack bars based on the request outcome and
/// network status.

class ForgetPasswordController extends GetxController {
  RxBool emailVal = true.obs;
  Rx<Color> emailborderColor = AppColors.blueColor.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  Rx<RequestState> requestState = RequestState.none.obs;
  ChangeVerifyCode changeVerifyCode = ChangeVerifyCode(apiCalls: Get.find());

/// Sends a verification code to the user's email for password reset.
///
/// This method validates the email input and listens for network changes.
/// If the device is online, it sends a request to change the verification
/// code. Upon success, it displays a success snack bar and navigates to the
/// verification screen. If the email does not exist, it shows an error snack
/// bar. If the device is offline, it displays an offline error snack bar.
  sendCode() async {
    if (formKey.currentState!.validate()) {
      listenToNetworkChanges();
      if (requestState.value == RequestState.online) {
        requestState.value = RequestState.loading;
        var response = await changeVerifyCode.changeVerifyCode(
          email: emailController.text,
        );
        if (response is RequestState) {
          requestState.value = response;
        } else {
          if (response['status'] == "success") {
            requestState.value = RequestState.success;
            snackBarWidget(
              title: response['status'],
              message: "Verification Code Changed Successfully",
              backgroundColor: AppColors.mediumBlueColor,
            );
            goToVerifyResetPassword();
          } else {
            requestState.value = RequestState.success;
            snackBarWidget(
              title: response['status'].toString().capitalize!,
              message: "This Email Doesn't exist",
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
  }

  goToVerifyResetPassword() {
    Get.offNamed(
      AppRoutesNames.verifyResetPwScreen,
      arguments: {'email': emailController.text},
    );
  }

  /// Listens to network changes and updates the request state.
  ///
  /// This method observes changes in the network request state using the
  /// `InternetService.requestState` and updates the local `requestState`
  /// accordingly. It ensures that the UI reflects the current network status
  /// by calling `update()` whenever a change is detected.
  void listenToNetworkChanges() {
    ever(InternetService.requestState, (state) {
      requestState.value = state;
      update();
    });
    requestState.value = InternetService.requestState.value;
  }

  @override
  void onInit() {
    super.onInit();
    listenToNetworkChanges();
    emailController = TextEditingController();
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
