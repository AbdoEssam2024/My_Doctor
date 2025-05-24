import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_doctor/const/colors/app_colors.dart';
import 'package:my_doctor/const/functions/navigation_extenstion.dart';
import 'package:my_doctor/const/functions/pop_func.dart';
import 'package:my_doctor/const/routes/routes_names.dart';
import 'package:my_doctor/view/auth_screens/signup_screen/widgets/signup_actions.dart';
import 'package:my_doctor/view/auth_screens/signup_screen/widgets/signup_inputs.dart';
import 'package:my_doctor/view/core_widgets/pop_widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late GlobalKey<FormState> formKey;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController mobileController;
  late TextEditingController birthController;
  late TextEditingController genderController;
  late TextEditingController ageController;

  initControllers() {
    formKey = GlobalKey<FormState>();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    mobileController = TextEditingController();
    birthController = TextEditingController();
    genderController = TextEditingController();
    ageController = TextEditingController();
  }

  disposeControllers() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    mobileController.dispose();
    birthController.dispose();
    genderController.dispose();
    ageController.dispose();
  }

  @override
  void initState() {
    initControllers();
    super.initState();
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScopeWidget(
      popAction: (didPop, res) {
        popFunc(
          didpop: didPop,
          result: () => context.pushNameAndRemove(routeName: AppRoutesNames.loginScreen),
        );
      },
      childWidget: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => context.pushNameAndRemove(routeName: AppRoutesNames.loginScreen),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.blueColor,
            ),
          ),
          toolbarHeight: 100.h,
          centerTitle: true,
          title: Text(
            "New Account",
            style: TextStyle(
              fontSize: 36,
              color: AppColors.blueColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),

        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            width: double.infinity,
            child: Form(
              key: formKey,
              child: Column(
                spacing: 50.h,
                children: [
                  signupInputs(
                    nameController: nameController,
                    emailController: emailController,
                    passwordController: passwordController,
                    mobileController: mobileController,
                    genderController: genderController,
                    ageController: ageController,
                  ),

                  signupActions(
                    goToLogin:
                        () => context.pushNameAndRemove(
                          routeName: AppRoutesNames.loginScreen,
                        ),

                    signUpFunc: () {
                      // Handle Sign Up Function
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
