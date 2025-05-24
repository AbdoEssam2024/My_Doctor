import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_doctor/const/app_theme/text_styles.dart';
import 'package:my_doctor/const/colors/app_colors.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final bool secureText;
  final bool fieldReadOnly;
  final Widget? fieldIcon;
  final TextInputType? textType;
  final String? Function(String?) validator;
  final Function()? tapFunction;
  final Function(String)? submmitFunc;
  const CustomFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    this.secureText = false,
    this.fieldIcon,
    required this.validator,
    this.textType, this.fieldReadOnly = false,
    this.tapFunction,
    this.submmitFunc,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: submmitFunc,
      onTap: tapFunction,
      readOnly: fieldReadOnly,
      keyboardType: textType,
      validator: validator,
      obscureText: secureText,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 10.w,
        ),
        focusedBorder: UnderlineInputBorder(

          borderSide: BorderSide(color: AppColors.blueColor, width: 2),
        ),
        
        hintText: hintText,
        hintStyle: TextStyles.font14Wieght400Grey,
        label: Text(
          labelText,
          style: TextStyles.font14Wieght400Grey,
        ),
        suffixIcon: fieldIcon,
      ),
    );
  }
}
