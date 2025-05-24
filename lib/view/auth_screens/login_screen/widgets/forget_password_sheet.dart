import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_doctor/const/app_theme/text_styles.dart';
import 'package:my_doctor/const/colors/app_colors.dart';
import 'package:my_doctor/const/functions/field_valid.dart';
import 'package:my_doctor/const/functions/navigation_extenstion.dart';
import 'package:my_doctor/const/routes/routes_names.dart';
import 'package:my_doctor/view/core_widgets/custom_form_field.dart';
import 'package:my_doctor/view/core_widgets/custom_btn.dart';

class ForgetPasswordSheet extends StatefulWidget {
  const ForgetPasswordSheet({super.key});

  @override
  State<ForgetPasswordSheet> createState() => _ForgetPasswordSheetState();
}

class _ForgetPasswordSheetState extends State<ForgetPasswordSheet> {
  late GlobalKey<FormState> formKey;
  late TextEditingController emailController;
  double sheetHight = 250.0.h;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: double.infinity.h,
      height: sheetHight,
      decoration: BoxDecoration(
        color: AppColors.lightBlueColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Center(
          child: Column(
            spacing: 10.h,
            children: [
              Text("Enter Your Email", style: TextStyles.font18Wieght600Blue),

              Text(
                "You will receive a code to reset your password",
                style: TextStyles.font14Wieght400Grey,
              ),

              Form(
                key: formKey,
                child: Column(
                  spacing: 20.h,
                  children: [
                    CustomFormField(
                      tapFunction: () {
                        setState(() {
                          sheetHight = 800.h;
                        });
                      },
                
                      submmitFunc: (val) {
                        setState(() {
                          sheetHight = 250.0.h;
                        });
                      },
                      controller: emailController,
                      hintText: "Enter Your Email",
                      labelText: "Email",
                      textType: TextInputType.emailAddress,
                      validator: (val) {
                        return validFields(
                          val: val!,
                          type: "email",
                          fieldName: "Email",
                          maxVal: 100,
                          minVal: 10,
                        );
                      },
                    ),
                
                    CustomBtn(
                      btnColor: AppColors.blueColor,
                      text: "Send Code",
                      btnFunc: () {
                        if (formKey.currentState!.validate()) {
                          context.pushName(
                            routeName: AppRoutesNames.resetPasswordScreen,
                            arguments: emailController.text,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
