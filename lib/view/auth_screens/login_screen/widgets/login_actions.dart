import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_doctor/const/app_theme/text_styles.dart';
import 'package:my_doctor/const/colors/app_colors.dart';
import 'package:my_doctor/controller/login_controller/login_cubit.dart';
import 'package:my_doctor/view/core_widgets/custom_btn.dart';

Widget loginActions({
  required BuildContext context,
  required GlobalKey<FormState> formKey,
  required TextEditingController emailController,
  required TextEditingController passwordController,
  required void Function() goToSignUp,
  required void Function() fingerPrintFunc,
}) {
  return Column(
    spacing: 20.h,
    children: [
      CustomBtn(
        btnColor: AppColors.blueColor,
        text: "Log In",
        btnFunc: () {
          context.read<LoginCubit>().loginFunc(
            formKey: formKey,
            context: context,
            email: emailController.text,
            password: passwordController.text,
          );
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
            style: TextStyles.font18Wieght600Blue,
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

      GestureDetector(
        onTap: fingerPrintFunc,

        child: Icon(Icons.fingerprint, size: 50, color: AppColors.blueColor),
      ),

      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't Have Account ?",
            style: TextStyles.font14Wieght400Grey,
          ),
          TextButton(
            onPressed: goToSignUp,
            child: Text(
              "Sign Up",
              style:  TextStyles.font18Wieght600Blue,
            ),
          ),
        ],
      ),
    ],
  );
}
