import 'package:get/get.dart';
import 'package:my_doctor/const/class/internet_service.dart';
import 'package:my_doctor/const/class/request_state.dart';
import 'package:my_doctor/const/colors/app_colors.dart';
import 'package:my_doctor/const/routes/routes_names.dart';
import 'package:my_doctor/repo/remote_data/auth_repo/change_code.dart';
import 'package:my_doctor/repo/remote_data/auth_repo/verify_email.dart';
import 'package:my_doctor/view/core_widgets/custom_snack_bar.dart';

class VerifyResetPwController extends GetxController {
  String email = '';
  String verifyCode = "";
  Rx<RequestState> requestState = RequestState.none.obs;
  VerifyEmail verifyEmailService = VerifyEmail(apiCalls: Get.find());
  ChangeVerifyCode changeVerifyCode = ChangeVerifyCode(apiCalls: Get.find());

  initialActions() {
    email = Get.arguments['email'] ?? '';
  }

  checkVerifyCode(String value) async {
    verifyCode = value;
    if (verifyCode.length > 3) {
      listenToNetworkChanges();
      if (requestState.value == RequestState.online) {
        requestState.value = RequestState.loading;
        var response = await verifyEmailService.verifyEmailData(
          email: email,
          code: int.tryParse(verifyCode) ?? 0,
        );

        if (response is RequestState) {
          requestState.value = response;
        } else {
          if (response['status'] == "success") {
            requestState.value = RequestState.success;
            snackBarWidget(
              title: 'Success',
              message: "Your Account Verified Successfully",
              backgroundColor: AppColors.mediumBlueColor,
            );
            goToResetPasswordPage();
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
  }

  changeVerifyCodeFunc() async {
    listenToNetworkChanges();
    if (requestState.value == RequestState.online) {
      requestState.value = RequestState.loading;
      var response = await changeVerifyCode.changeVerifyCode(email: email);
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
        } else {
          requestState.value = RequestState.success;
          snackBarWidget(
            title: response['status'],
            message: "Can't Resend Code , Try Again Later",
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

  backToForgetPasswordPage() {
    Get.offAllNamed(AppRoutesNames.forgotPasswordScreen);
  }

  goToResetPasswordPage() {
    Get.offNamed(AppRoutesNames.resetPassword, arguments: {'email': email});
  }

  @override
  void onInit() {
    initialActions();
    listenToNetworkChanges();
    super.onInit();
  }

  void listenToNetworkChanges() {
    ever(InternetService.requestState, (state) {
      requestState.value = state;
      update();
    });
    requestState.value = InternetService.requestState.value;
  }
}
