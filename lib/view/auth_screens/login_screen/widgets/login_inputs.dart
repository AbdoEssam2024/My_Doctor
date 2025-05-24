import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_doctor/const/app_theme/text_styles.dart';
import 'package:my_doctor/const/colors/app_colors.dart';
import 'package:my_doctor/const/functions/field_valid.dart';
import 'package:my_doctor/controller/login_controller/login_cubit.dart';
import 'package:my_doctor/controller/login_controller/login_state.dart';
import 'package:my_doctor/view/core_widgets/custom_form_field.dart';

Widget loginInputs({
  required TextEditingController emailController,
  required TextEditingController passwordController,
  required void Function() forgetPwFunc,
}) {
  return Column(
    spacing: 30.h,
    children: [
      CustomFormField(
        validator: (val) {
          return validFields(
            val: val!,
            type: "email",
            fieldName: "Email",
            maxVal: 100,
            minVal: 10,
          );
        },
        controller: emailController,
        hintText: "Enter Your Email",
        labelText: "Email",
      ),
      BlocBuilder<LoginCubit, LoginState>(
        builder:
            (context, state) => CustomFormField(
              secureText: state.showPass,
              validator: (val) {
                return validFields(
                  val: val!,
                  type: "password",
                  fieldName: "Password",
                  maxVal: 30,
                  minVal: 6,
                );
              },
              controller: passwordController,
              hintText: "Enter Your Password",
              labelText: "Password",
              fieldIcon: GestureDetector(
                onTap: () => context.read<LoginCubit>().toggleShowPass(),
                child: Icon(
                  state.showPass
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  size: 25,
                  color:
                      state.showPass
                          ? AppColors.greyColor
                          : AppColors.blueColor,
                ),
              ),
            ),
      ),

      Container(
        alignment: Alignment.centerRight,
        width: double.infinity,
        child: TextButton(
          onPressed: forgetPwFunc,
          child: Text(
            "Forget Password",
            style: TextStyles.font14Wieght400Grey!.copyWith(
              color: AppColors.blueColor,
            ),
          ),
        ),
      ),
    ],
  );
}
