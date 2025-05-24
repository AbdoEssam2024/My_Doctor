import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_doctor/const/app_theme/text_styles.dart';
import 'package:my_doctor/const/colors/app_colors.dart';
import 'package:my_doctor/const/functions/field_valid.dart';
import 'package:my_doctor/controller/signup_controller/signup_cubit.dart';
import 'package:my_doctor/controller/signup_controller/signup_state.dart';
import 'package:my_doctor/view/core_widgets/custom_form_field.dart';

Widget signupInputs({
  required TextEditingController nameController,
  required TextEditingController emailController,
  required TextEditingController passwordController,
  required TextEditingController mobileController,
  required TextEditingController genderController,
  required TextEditingController ageController,
}) {
  return Column(
    spacing: 30.h,
    children: [
      CustomFormField(
        validator: (val) {
          return validFields(
            val: val!,
            type: "name",
            fieldName: "Full Name",
            maxVal: 100,
            minVal: 6,
          );
        },
        controller: nameController,
        hintText: "Enter Your Name",
        labelText: "Full Name",
        textType: TextInputType.name,
      ),
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
        textType: TextInputType.emailAddress,
      ),

      CustomFormField(
        validator: (val) {
          return validFields(
            val: val!,
            type: "mobile",
            fieldName: "Mobile Number",
            maxVal: 16,
            minVal: 9,
          );
        },
        controller: mobileController,
        textType: TextInputType.phone,
        hintText: "Enter Your Mobile Number",
        labelText: "Mobile Number",
      ),

      CustomFormField(
        validator: (val) {
          return validFields(
            val: val!,
            type: "age",
            fieldName: "Age",
            maxVal: 3,
            minVal: 1,
          );
        },
        controller: ageController,
        textType: TextInputType.number,
        hintText: "Enter Your Age",
        labelText: "Age",
      ),

      DropdownButtonFormField<String>(
        value: "Male",
        items:
            ["Male", "Female"]
                .map(
                  (gender) => DropdownMenuItem<String>(
                    value: gender,
                    child: Text(gender, style: TextStyles.font14Wieght400Grey),
                  ),
                )
                .toList(),
        onChanged: (value) {
          genderController.text = value!;
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
          label: Text("Gender", style: TextStyles.font14Wieght400Grey),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.blueColor, width: 2),
          ),
        ),
        validator: (value) {
          return validFields(
            val: value!,
            type: "gender",
            fieldName: "Gender",
            maxVal: 20,
            minVal: 4,
          );
        },
      ),

      BlocBuilder<SignupCubit, SignupState>(
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
                onTap: () => context.read<SignupCubit>().toggleShowPass(),
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
    ],
  );
}
