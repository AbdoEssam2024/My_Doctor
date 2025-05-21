import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_doctor/const/class/screen_size.dart';
import 'package:my_doctor/const/colors/app_colors.dart';
import 'package:my_doctor/controller/login_controller/login_cubit.dart';
import 'package:my_doctor/view/core_widgets/custom_btn.dart';

Widget loginActions({
  required BuildContext context,
  required GlobalKey<FormState> formKey,
  required TextEditingController emailController,
  required TextEditingController passwordController,
  required void Function() goToSignUp,
}) {
  return Column(
    spacing: ScreenSize.screenWidth! * 0.05,
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
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
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

      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't Have Account ?",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          TextButton(
            onPressed: goToSignUp,
            child: Text(
              "Sign Up",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: AppColors.blueColor,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
