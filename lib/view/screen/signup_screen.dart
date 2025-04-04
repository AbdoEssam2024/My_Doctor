import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_doctor/const/class/screen_size.dart';
import 'package:my_doctor/const/colors/app_colors.dart';
import 'package:my_doctor/const/functions/field_valid.dart';
import 'package:my_doctor/const/functions/pop_func.dart';
import 'package:my_doctor/controller/auth_controllers/signup_controller.dart';
import 'package:my_doctor/view/core_widgets/custom_btn.dart';
import 'package:my_doctor/view/core_widgets/custom_form_field.dart';
import 'package:my_doctor/view/core_widgets/pop_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return PopScopeWidget(
      popAction: (didPop, res) {
        popFunc(didpop: didPop, result: controller.goToLoginScreen());
      },
      childWidget: Scaffold(
        appBar: AppBar(
          toolbarHeight: ScreenSize.screenWidth! * 0.25,
          centerTitle: true,
          title: Text(
            "New Account",
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
            child: Form(
              key: controller.signUpformKey,
              child: Column(
                spacing: ScreenSize.screenWidth! * 0.1,
                children: [
                  Column(
                    spacing: ScreenSize.screenWidth! * 0.1,
                    children: [
                      CustomFormField(
                        validator: (val) {
                          return validFields(
                            val: val!,
                            type: "name",
                            fieldName: "Full Name",
                            maxVal: 100,
                            minVal: 6,
                          );
                        },
                        controller: controller.fullNameController,
                        hintText: "Enter Your Name",
                        labelText: "Full Name",
                        fieldIcon: Icon(Icons.person_2_outlined, size: 35),
                      ),
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
                        fieldIcon: Icon(Icons.alternate_email, size: 35),
                      ),
                      GetBuilder<SignupController>(
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
                  
                      CustomFormField(
                        validator: (val) {
                          return validFields(
                            val: val!,
                            type: "mobile",
                            fieldName: "Mobile Number",
                            maxVal: 16,
                            minVal: 9,
                          );
                        },
                        controller: controller.mobileController,
                        textType: TextInputType.phone,
                        hintText: "Enter Your Mobile Number",
                        labelText: "Mobile Number",
                        fieldIcon: Icon(Icons.phone_android, size: 35),
                      ),
                  
                      CustomFormField(
                        fieldReadOnly: true,
                        validator: (val) {
                          return validFields(
                            val: val!,
                            type: "birth",
                            fieldName: "Birth Date",
                            maxVal: 20,
                            minVal: 8,
                          );
                        },
                        controller: controller.birthController,
                        textType: TextInputType.text,
                        hintText: "Pick Your Birth Date",
                        labelText: "Birth Date",
                        fieldIcon: IconButton(
                          onPressed:
                              () => controller.pickDate(
                                context,
                                controller.birthController,
                              ),
                          icon: Icon(Icons.calendar_month, size: 35),
                        ),
                      ),
                    ],
                  ),

                  Column(
                    spacing: ScreenSize.screenWidth! * 0.05,
                    children: [
                      CustomBtn(
                        btnColor: AppColors.blueColor,
                        text: "Sign Up",
                        btnFunc: () {
                          controller.signUpFunc();
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
                            "Already Have Account ?",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              controller.goToLoginScreen();
                            },
                            child: Text(
                              "Log In",
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
    );
  }
}
