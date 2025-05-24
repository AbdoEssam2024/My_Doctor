import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBtn extends StatelessWidget {
  final String text;
  final Color? btnColor;
  final Color textColor;
  final void Function() btnFunc;
  const CustomBtn({
    super.key,
    required this.text,
    this.btnColor,
    this.textColor = Colors.white,
    required this.btnFunc,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      padding: EdgeInsets.symmetric(
        vertical: 10.h,
        horizontal: 20.w,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      color: btnColor,
      textColor: textColor,
      onPressed: btnFunc,
      child: Text(text, style: TextStyle(fontSize: 16.sp)),
    );
  }
}
