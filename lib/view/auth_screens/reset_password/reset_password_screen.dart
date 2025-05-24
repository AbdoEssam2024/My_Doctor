import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_doctor/const/app_theme/text_styles.dart';
import 'package:my_doctor/const/colors/app_colors.dart';
import 'package:my_doctor/const/functions/navigation_extenstion.dart';
import 'package:my_doctor/const/functions/pop_func.dart';
import 'package:my_doctor/view/auth_screens/reset_password/widgets/otp_widget.dart';
import 'package:my_doctor/view/core_widgets/pop_widget.dart';
import 'package:my_doctor/view/core_widgets/custom_btn.dart';


class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});
  final String email ;

  @override
    Widget build(BuildContext context) {
    return PopScopeWidget(
      popAction: (didpop, p1) {
        popFunc(didpop: didpop, result: () => context.pop());
      },
      childWidget: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => context.pop(),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.blueColor,
            ),
          ),
          toolbarHeight: 100.h,
          centerTitle: true,
          title: Text(
            "Verify Email",
            style: TextStyles.font28Wieght500Blue,
          ),
        ),
        body: Center(
              child: Container(
                margin: EdgeInsets.only(top: 100.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 50.h,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Verification Code sent to : ",
                          textAlign: TextAlign.center,
                          style: TextStyles.font28Wieght500Blue!.copyWith(
                            fontSize: 20.sp,
                            color: AppColors.blackColor,
                          ),
                        ),
                        Text(
                          email,
                          textAlign: TextAlign.center,
                          style: TextStyles.font18Wieght600Blue,
                        ),
                      ],
                    ),

                    OtpWidget(
                      onSubmitCode: (code) {
                        // controller.checkVerifyCode(code);
                      },
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                      ),
                      child: CustomBtn(
                        btnColor: AppColors.blueColor,
                        text: "Resend Code",
                        btnFunc: () {
                          // controller.changeVerifyCodeFunc();
                        },
                      ),
                    ),



                  ],
                ),
              ),
            ),
      ),
    );
  }
}