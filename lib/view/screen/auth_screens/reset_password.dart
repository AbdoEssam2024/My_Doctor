import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_doctor/const/class/screen_size.dart';
import 'package:my_doctor/const/colors/app_colors.dart';
import 'package:my_doctor/const/functions/field_valid.dart';
import 'package:my_doctor/const/functions/pop_func.dart';
import 'package:my_doctor/const/images/app_images.dart';
import 'package:my_doctor/const/routes/routes_names.dart';
import 'package:my_doctor/controller/auth_controllers/reset_password_controller.dart';
import 'package:my_doctor/view/core_widgets/custom_btn.dart';
import 'package:my_doctor/view/core_widgets/custom_form_field.dart';
import 'package:my_doctor/view/core_widgets/handling_view.dart';
import 'package:my_doctor/view/core_widgets/pop_widget.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ResetPwController());
    return PopScopeWidget(
      popAction: (didpop, p1) {
        popFunc(
          didpop: didpop,
          result: Get.offNamed(AppRoutesNames.forgotPasswordScreen),
        );
      },
      childWidget: Scaffold(
        appBar: AppBar(
          toolbarHeight: ScreenSize.screenWidth! * 0.25,
          centerTitle: true,
          title: Column(
            spacing: ScreenSize.screenWidth! * 0.01,
            children: [
              Text(
                "Reset Password",
                style: TextStyle(
                  fontSize: 36,
                  color: AppColors.blueColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                controller.email,
                style: TextStyle(
                  fontSize: 24,
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenSize.screenWidth! * 0.04,
            ),
            child: Form(
              key: controller.formKey,
              child: SizedBox(
                width: ScreenSize.screenWidth,
                child: Obx(
                  () => HandlingView(
                    requestState: controller.requestState.value,
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: ScreenSize.screenWidth! * 0.08,
                      children: [
                        Image.asset(AppImages.resetPassword),

                        Obx(
                          () => CustomFormField(
                            secureText: controller.showPass.value,
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
                                  controller.showPass.value
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

                        Obx(
                          () => CustomFormField(
                            secureText: controller.showPass.value,
                            validator: (val) {
                              return validFields(
                                val: val!,
                                type: "password",
                                fieldName: "Confirm Password",
                                maxVal: 30,
                                minVal: 6,
                              );
                            },
                            controller: controller.confirmPasswordController,
                            hintText: "Enter Your Confirm Password",
                            labelText: "Confirm Password",
                            fieldIcon: IconButton(
                              onPressed: () {
                                controller.toggleShowPass();
                              },
                              icon:
                                  controller.showPass.value
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

                        CustomBtn(
                          btnColor: AppColors.blueColor,
                          text: "Save Password",
                          btnFunc: () {
                            controller.goToSuccessPage();
                          },
                        ),
                      ],
                    ),
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
