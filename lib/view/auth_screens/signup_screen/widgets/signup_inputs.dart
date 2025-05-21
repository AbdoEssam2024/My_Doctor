import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_doctor/const/class/screen_size.dart';
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
}) {
  return Column(
    spacing: ScreenSize.screenHeight! * 0.05,
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
        fieldIcon: Icon(
          Icons.person_2_outlined,
          size: 35,
          color: AppColors.blueColor,
        ),
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
        fieldIcon: Icon(
          Icons.alternate_email,
          size: 35,
          color: AppColors.blueColor,
        ),
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
              fieldIcon: IconButton(
                onPressed: () {
                  context.read<SignupCubit>().toggleShowPass();
                },
                icon:
                    state.showPass
                        ? Icon(Icons.visibility_off_outlined, size: 35 , color: AppColors.blueColor)
                        : Icon(
                          Icons.visibility_outlined,
                          size: 35,
                          color: AppColors.blueColor,
                        ),
              ),
            ),
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
        fieldIcon: Icon(
          Icons.phone_android,
          size: 35,
          color: AppColors.blueColor,
        ),
      ),

      DropdownButtonFormField<String>(
        value: "Male",
        items:
            ["Male", "Female"]
                .map(
                  (gender) => DropdownMenuItem<String>(
                    value: gender,
                    child: Text(gender),
                  ),
                )
                .toList(),
        onChanged: (value) {
          genderController.text = value!;
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: ScreenSize.screenWidth! * 0.02,
          ),
          label: Text(
            "Gender",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.blackColor,
            ),
          ),

          suffixIcon: Icon(
            Icons.transgender,
            size: 35,
            color: AppColors.blueColor,
          ),
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
    ],
  );
}
