import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_doctor/const/app_theme/text_styles.dart';
import 'package:my_doctor/const/colors/app_colors.dart';

class OtpWidget extends StatelessWidget {
  final void Function(String) onSubmitCode;

  const OtpWidget({super.key, required this.onSubmitCode});

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      numberOfFields: 4,
      textStyle: TextStyles.font18Wieght600Blue,
      contentPadding: EdgeInsets.symmetric(vertical: 15.h),
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      autoFocus: true,
      enabled: true,
      enabledBorderColor: AppColors.blueColor,
      focusedBorderColor: AppColors.greenColor,
      cursorColor: Colors.transparent,
      keyboardType: TextInputType.number,
      fieldWidth: 20.w,
      fieldHeight: 20.h,
      onSubmit: onSubmitCode,
      clearText: true,
    );
  }
}
