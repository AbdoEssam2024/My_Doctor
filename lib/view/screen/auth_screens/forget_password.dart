import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_doctor/const/class/screen_size.dart';
import 'package:my_doctor/const/colors/app_colors.dart';
import 'package:my_doctor/const/functions/field_valid.dart';
import 'package:my_doctor/const/functions/pop_func.dart';
import 'package:my_doctor/const/images/app_images.dart';
import 'package:my_doctor/const/routes/routes_names.dart';
import 'package:my_doctor/controller/auth_controllers/forget_password_controller.dart';
import 'package:my_doctor/view/core_widgets/custom_btn.dart';
import 'package:my_doctor/view/core_widgets/custom_form_field.dart';
import 'package:my_doctor/view/core_widgets/forget_options.dart';
import 'package:my_doctor/view/core_widgets/handling_view.dart';
import 'package:my_doctor/view/core_widgets/pop_widget.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return PopScopeWidget(
      popAction: (didpop, p1) {
        popFunc(
          didpop: didpop,
          result: Get.offNamed(AppRoutesNames.loginScreen),
        );
      },
      childWidget: Scaffold(
        appBar: AppBar(
          toolbarHeight: ScreenSize.screenWidth! * 0.25,
          centerTitle: true,
          title: Text(
            "Forget Password",
            style: TextStyle(
              fontSize: 36,
              color: AppColors.blueColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Obx(
            () => HandlingView(
              requestState: controller.requestState.value,
              widget: Column(
                spacing: ScreenSize.screenHeight! * 0.05,
                children: [
                  SizedBox(
                    height: ScreenSize.screenHeight! * 0.3,
                    child: Image.asset(AppImages.verify),
                  ),

                  Form(
                    key: controller.formKey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenSize.screenWidth! * 0.04,
                      ),
                      child: CustomFormField(
                        hintText: "Please Enter Your Email",
                        secureText: false,
                        fieldIcon: Image.asset(
                          color: AppColors.blueColor,
                          AppImages.resetEmail,
                        ),
                        labelText: "Email",

                        controller: controller.emailController,
                        validator: (value) {
                          return validFields(
                            val: value!,
                            type: "email",
                            fieldName: "Email",
                            maxVal: 100,
                            minVal: 10,
                          );
                        },
                      ),
                    ),
                  ),

                  ForgetOptions(
                    borderColor: controller.emailborderColor.value,
                    imageColor: controller.emailborderColor.value,
                    val: controller.emailVal.value,
                    image: AppImages.resetEmail,
                    title: "Reset via email",
                    subtitle: "You Will receive a code in your email",
                    checkBoxFunc: (value) {
                      // controller.emailSelected(value!);
                    },
                  ),

                  CustomBtn(
                    btnColor: AppColors.blueColor,
                    text: "Send Code",
                    btnFunc: () {
                      controller.sendCode();
                    },
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
