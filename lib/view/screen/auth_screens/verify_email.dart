import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_doctor/const/class/screen_size.dart';
import 'package:my_doctor/const/colors/app_colors.dart';
import 'package:my_doctor/const/functions/pop_func.dart';
import 'package:my_doctor/controller/auth_controllers/verify_email_controller.dart';
import 'package:my_doctor/view/core_widgets/custom_btn.dart';
import 'package:my_doctor/view/core_widgets/handling_view.dart';
import 'package:my_doctor/view/core_widgets/otp_widget.dart';
import 'package:my_doctor/view/core_widgets/pop_widget.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return PopScopeWidget(
      popAction: (didpop, p1) {
        popFunc(didpop: didpop, result: controller.backToLoginPage());
      },
      childWidget: Scaffold(
        appBar: AppBar(
          toolbarHeight: ScreenSize.screenWidth! * 0.25,
          centerTitle: true,
          title: Text(
            "Verify Email",
            style: TextStyle(
              fontSize: 36,
              color: AppColors.blueColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: Obx(
          () => HandlingView(
            requestState: controller.requestState.value,
            widget: Center(
              child: Container(
                margin: EdgeInsets.only(top: ScreenSize.screenWidth! * 0.2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: ScreenSize.screenWidth! * 0.1,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Verification Code sent to: ",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          controller.email,
                          style: TextStyle(
                            fontSize: 22,
                            color: AppColors.blueColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),

                    OtpWidget(
                      onSubmitCode: (code) {
                        controller.checkVerifyCode(code);
                      },
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenSize.screenWidth! * 0.05,
                      ),
                      child: CustomBtn(
                        btnColor: AppColors.blueColor,
                        text: "Resend Code",
                        btnFunc: () {
                          controller.changeVerifyCodeFunc();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
