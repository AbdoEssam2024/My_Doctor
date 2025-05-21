import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_doctor/const/class/screen_size.dart';
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
    spacing: ScreenSize.screenWidth! * 0.1,
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
        fieldIcon: Icon(
          Icons.alternate_email,
          size: 35,
          color: AppColors.blueColor,
        ),
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
              fieldIcon: IconButton(
                onPressed: () {
                  context.read<LoginCubit>().toggleShowPass();
                },
                icon:
                    state.showPass
                        ? Icon(
                          Icons.visibility_off_outlined,
                          size: 35,
                          color: AppColors.blueColor,
                        )
                        : Icon(
                          Icons.visibility_outlined,
                          size: 35,
                          color: AppColors.blueColor,
                        ),
              ),
            ),
      ),

      Container(
        alignment: Alignment.centerRight,
        width: ScreenSize.screenWidth,
        child: TextButton(
          onPressed: forgetPwFunc,
          child: Text(
            "Forget Password",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.blueColor,
            ),
          ),
        ),
      ),
    ],
  );
}
