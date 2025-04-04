import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:my_doctor/const/class/request_state.dart';
import 'package:my_doctor/const/colors/app_colors.dart';
import 'package:my_doctor/const/routes/routes_names.dart';
import 'package:my_doctor/model/user_data_model.dart';
import 'package:my_doctor/repo/user_data.dart';

class LoginController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  UserData userData = UserData(apiCalls: Get.find());
  List<UserDataModel> userDataList = [];
  RequestState requestState = RequestState.none;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool showPass = true;
  Connectivity connectivity = Connectivity();

  updateConnectionStatus(List<ConnectivityResult> connectivityResultList) {
    if (connectivityResultList.contains(ConnectivityResult.none)) {
      requestState = RequestState.offline;
      Get.snackbar(
        "",
        "",
        animationDuration: Duration(seconds: 2),
        backgroundColor: Colors.red,
        messageText: Text(
          "No Internet Connection",
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        titleText: Text(
          "Disconnected",
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
      );
    } else {
      requestState = RequestState.online;
      Get.snackbar(
        "",
        "",
        animationDuration: Duration(seconds: 2),
        backgroundColor: AppColors.blueColor,
        messageText: Text(
          "Connection Restored SuxxessFully",
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        titleText: Text(
          "Connected",
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
      );
    }
    update();
  }

  initConnectivity() {
    connectivity.onConnectivityChanged.listen(updateConnectionStatus);
  }

  loginFunc() async {
    if (formKey.currentState!.validate()) {
      if (requestState == RequestState.online) {
        requestState = RequestState.loading;
        List data = [];
        var response = await userData.getUserData(
          email: emailController.text,
          password: passwordController.text,
        );

        if (response is RequestState) {
          requestState = response;
        } else {
          data.add(response);

          userDataList =
              data.map((user) => UserDataModel.fromJson(user)).toList();

          requestState = RequestState.success;

          Get.offNamed(AppRoutesNames.homeScreen, arguments: userDataList);
        }
      } else {
        requestState = RequestState.offline;
      }
    }
    update();
  }

  toggleShowPass() {
    showPass = !showPass;
    update();
  }

  goToSignUpPage() {
    Get.offNamed(AppRoutesNames.signupScreen);
  }

  initControllers() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  disposeControllers() {
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  void onInit() {
    initConnectivity();
    initControllers();
    super.onInit();
  }

  @override
  void onClose() {
    disposeControllers();
    super.onClose();
  }
}
