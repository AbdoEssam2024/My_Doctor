import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_doctor/const/class/internet_service.dart';
import 'package:my_doctor/const/class/request_state.dart';
import 'package:my_doctor/const/colors/app_colors.dart';
import 'package:my_doctor/const/routes/routes_names.dart';
import 'package:my_doctor/main.dart';
import 'package:my_doctor/model/user_data_model.dart';
import 'package:my_doctor/repo/remote_data/auth_repo/login_data.dart';
import 'package:my_doctor/view/core_widgets/custom_snack_bar.dart';

class LoginController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  LoginUserData userData = LoginUserData(apiCalls: Get.find());
  List<UserDataModel> userDataList = [];
  Rx<RequestState> requestState = RequestState.none.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool showPass = true;

  loginFunc() async {
    if (formKey.currentState!.validate()) {
      listenToNetworkChanges();
      if (requestState.value == RequestState.online) {
        requestState.value = RequestState.loading;
        List data = [];
        var response = await userData.getUserData(
          email: emailController.text,
          password: passwordController.text,
        );
        if (response is RequestState) {
          requestState.value = response;
        } else {
          loginSuccess(data: data, response: response);
        }
      } else {
        requestState.value = RequestState.offline;
      }
      update();
    }
  }

  loginSuccess({required List data, required var response}) {
    if (response['status'] == "success") {
      data.add(response['data']);
      userDataBox.put("userData", data[0]);
      userDataList = data.map((user) => UserDataModel.fromJson(user)).toList();
      requestState.value = RequestState.success;
      userDataBox.put("visit", 2);
      Get.offNamed(
        AppRoutesNames.homeScreen,
        arguments: {"userData": userDataList},
      );
    } else {
      snackBarWidget(
        title: response['status'],
        message: response['message'],
        backgroundColor: AppColors.redColor,
      );
      requestState.value = RequestState.success;
    }
  }

  toggleShowPass() {
    showPass = !showPass;
    update();
  }

  goToSignUpPage() {
    Get.offNamed(AppRoutesNames.signupScreen);
  }

  goToForgetPasswordPage() {
    Get.offNamed(AppRoutesNames.forgotPasswordScreen);
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
    listenToNetworkChanges();
  }

  disposeControllers() {
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    initControllers();
  }

  @override
  void onClose() {
    disposeControllers();
    super.onClose();
  }
}
