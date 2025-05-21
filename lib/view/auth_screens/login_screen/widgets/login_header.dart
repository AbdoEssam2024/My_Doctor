import 'package:flutter/material.dart';
import 'package:my_doctor/const/colors/app_colors.dart';

Widget loginHeader() {
  return Column(
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
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      ),
    ],
  );
}
