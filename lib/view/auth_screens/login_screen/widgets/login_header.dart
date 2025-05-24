import 'package:flutter/material.dart';
import 'package:my_doctor/const/app_theme/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget loginHeader() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: 10.h,
    children: [
      Text(
        "Welcome",
        style: TextStyles.font28Wieght500Blue,
      ),
      Text(
        "Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.",
        style: TextStyles.font14Wieght400Grey,
      ),
    ],
  );
}
