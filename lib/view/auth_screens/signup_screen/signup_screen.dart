import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_doctor/const/class/screen_size.dart';
import 'package:my_doctor/const/colors/app_colors.dart';
import 'package:my_doctor/const/functions/pop_func.dart';
import 'package:my_doctor/controller/signup_controller/signup_cubit.dart';
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

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    mobileController = TextEditingController();
    birthController = TextEditingController();
    genderController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    mobileController.dispose();
    birthController.dispose();
    genderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScopeWidget(
      popAction: (didPop, res) {
        popFunc(
          didpop: didPop,
          result: () => context.read<SignupCubit>().goToLoginPage(context),
        );
      },
      childWidget: Scaffold(
        appBar: AppBar(
          toolbarHeight: ScreenSize.screenWidth! * 0.25,
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
            padding: EdgeInsets.symmetric(
              horizontal: ScreenSize.screenWidth! * 0.05,
            ),
            width: ScreenSize.screenWidth,
            child: Form(
              key: formKey,
              child: Column(
                spacing: ScreenSize.screenHeight! * 0.1,
                children: [
                  signupInputs(
                    nameController: nameController,
                    emailController: emailController,
                    passwordController: passwordController,
                    mobileController: mobileController,
                    genderController: genderController,
                  ),

                  signupActions(
                    goToLogin:
                        () =>
                            context.read<SignupCubit>().goToLoginPage(context),

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
