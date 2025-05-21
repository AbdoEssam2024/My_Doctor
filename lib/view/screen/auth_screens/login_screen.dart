import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_doctor/const/class/screen_size.dart';
import 'package:my_doctor/const/colors/app_colors.dart';
import 'package:my_doctor/const/functions/field_valid.dart';
import 'package:my_doctor/const/functions/pop_func.dart';
import 'package:my_doctor/controller/auth_controllers/login_controller.dart';
import 'package:my_doctor/view/core_widgets/custom_btn.dart';
import 'package:my_doctor/view/core_widgets/custom_form_field.dart';
import 'package:my_doctor/view/core_widgets/handling_view.dart';
import 'package:my_doctor/view/core_widgets/pop_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    final controller = Get.put(LoginController());
    return PopScopeWidget(
      popAction: (didPop, res) {
        popFunc(didpop: didPop, result: exit(0));
      },

      childWidget: Scaffold(
        appBar: AppBar(
          toolbarHeight: ScreenSize.screenWidth! * 0.25,
          centerTitle: true,
          title: Text(
            "Login",
            style: TextStyle(
              fontSize: 36,
              color: AppColors.blueColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),

        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenSize.screenWidth! * 0.05,
            ),
            width: ScreenSize.screenWidth,
            child: Obx(
              () => HandlingView(
                requestState: controller.requestState.value,
                widget: Form(
                  key: controller.formKey,
                  child: Column(
                    spacing: ScreenSize.screenWidth! * 0.1,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome",
                            style: TextStyle(
                              fontSize: 30,
                              color: AppColors.blueColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: ScreenSize.screenWidth! * 0.04,
                        children: [
                          Column(
                            spacing: ScreenSize.screenWidth! * 0.1,
                            children: [
                              CustomFormField(
                                validator: (val) {
                                  return validFields(
                                    val: val!,
                                    type: "email",
                                    fieldName: "Email",
                                    maxVal: 100,
                                    minVal: 10,
                                  );
                                },
                                controller: controller.emailController,
                                hintText: "Enter Your Email",
                                labelText: "Email",
                                fieldIcon: Icon(
                                  Icons.alternate_email,
                                  size: 35,
                                ),
                              ),
                              GetBuilder<LoginController>(
                                builder:
                                    (controller) => CustomFormField(
                                      secureText: controller.showPass,
                                      validator: (val) {
                                        return validFields(
                                          val: val!,
                                          type: "password",
                                          fieldName: "Password",
                                          maxVal: 30,
                                          minVal: 6,
                                        );
                                      },
                                      controller: controller.passwordController,
                                      hintText: "Enter Your Password",
                                      labelText: "Password",
                                      fieldIcon: IconButton(
                                        onPressed: () {
                                          controller.toggleShowPass();
                                        },
                                        icon:
                                            controller.showPass
                                                ? Icon(
                                                  Icons.visibility_off_outlined,
                                                  size: 35,
                                                )
                                                : Icon(
                                                  Icons.visibility_outlined,
                                                  size: 35,
                                                ),
                                      ),
                                    ),
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            width: ScreenSize.screenWidth,
                            child: TextButton(
                              onPressed: () {
                                controller.goToForgetPasswordPage();
                              },
                              child: Text(
                                "Forget Password",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.blueColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      Column(
                        spacing: ScreenSize.screenWidth! * 0.05,
                        children: [
                          CustomBtn(
                            btnColor: AppColors.blueColor,
                            text: "Log In",
                            btnFunc: () {
                              controller.loginFunc();
                            },
                          ),

                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: AppColors.blueColor,
                                  endIndent: 10,
                                  thickness: 2,
                                ),
                              ),
                              Text(
                                "Or",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  color: AppColors.blueColor,
                                  indent: 10,
                                  thickness: 2,
                                ),
                              ),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't Have Account ?",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  controller.goToSignUpPage();
                                },
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.blueColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
