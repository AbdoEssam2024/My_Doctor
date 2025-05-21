import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:my_doctor/const/class/screen_size.dart';
import 'package:my_doctor/const/colors/app_colors.dart';

class OtpWidget extends StatelessWidget {
  final void Function(String) onSubmitCode;

  const OtpWidget({super.key, required this.onSubmitCode});

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      numberOfFields: 4,
      textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
      contentPadding: EdgeInsets.symmetric(
        vertical: ScreenSize.screenHeight! * 0.015,
      ),
      showFieldAsBox: true,
      margin: EdgeInsets.symmetric(
        horizontal: ScreenSize.screenHeight! * 0.015,
      ),
      enabledBorderColor: AppColors.otpBorder,
      borderRadius: BorderRadius.circular(15),
      fieldWidth: ScreenSize.screenWidth! * 0.12,
      fieldHeight: ScreenSize.screenHeight! * 0.07,
      borderWidth: 4.0,
      onSubmit: onSubmitCode,
      clearText: true,
    );
  }
}
