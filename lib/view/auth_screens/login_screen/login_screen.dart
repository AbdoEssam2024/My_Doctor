import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_doctor/const/class/screen_size.dart';
import 'package:my_doctor/const/colors/app_colors.dart';
import 'package:my_doctor/const/functions/pop_func.dart';
import 'package:my_doctor/controller/login_controller/login_cubit.dart';
import 'package:my_doctor/view/auth_screens/login_screen/widgets/login_actions.dart';
import 'package:my_doctor/view/auth_screens/login_screen/widgets/login_header.dart';
import 'package:my_doctor/view/auth_screens/login_screen/widgets/login_inputs.dart';
import 'package:my_doctor/view/core_widgets/pop_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late GlobalKey<FormState> formKey;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return PopScopeWidget(
      popAction: (didPop, res) {
        popFunc(didpop: didPop, result: exit(0));
      },

      childWidget: Scaffold(
        appBar: AppBar(
          toolbarHeight: ScreenSize.screenWidth! * 0.25,
          centerTitle: true,
          title: Text(
            "Login",
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
                spacing: ScreenSize.screenWidth! * 0.1,
                children: [
                  loginHeader(),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: ScreenSize.screenWidth! * 0.04,
                    children: [
                      loginInputs(
                        emailController: emailController,
                        passwordController: passwordController,
                        forgetPwFunc: () {
                          // Handle Go To Forget Password Screen
                        },
                      ),
                    ],
                  ),

                  loginActions(
                    context: context,
                    formKey: formKey,
                    emailController: emailController,
                    passwordController: passwordController,
                    goToSignUp:
                        () =>
                            context.read<LoginCubit>().goToSignUpPage(context),
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
