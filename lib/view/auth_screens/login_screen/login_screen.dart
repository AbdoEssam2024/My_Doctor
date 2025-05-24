import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:my_doctor/const/colors/app_colors.dart';
import 'package:my_doctor/const/functions/navigation_extenstion.dart';
import 'package:my_doctor/const/functions/pop_func.dart';
import 'package:my_doctor/const/images/app_images.dart';
import 'package:my_doctor/const/routes/routes_names.dart';
import 'package:my_doctor/controller/login_controller/login_state.dart';
import 'package:my_doctor/view/auth_screens/login_screen/widgets/forget_password_sheet.dart';
import 'package:my_doctor/view/auth_screens/login_screen/widgets/login_actions.dart';
import 'package:my_doctor/view/auth_screens/login_screen/widgets/login_header.dart';
import 'package:my_doctor/view/auth_screens/login_screen/widgets/login_inputs.dart';
import 'package:my_doctor/view/core_widgets/pop_widget.dart';
import 'package:my_doctor/controller/login_controller/login_cubit.dart';

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
    return PopScopeWidget(
      popAction: (didPop, res) {
        popFunc(didpop: didPop, result: exit(0));
      },

      childWidget: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100.h,
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
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            width: double.infinity,
            child: Form(
              key: formKey,
              child: BlocBuilder<LoginCubit, LoginState>(
                builder:
                    (context, state) => Stack(
                      children: [
                        Column(
                          spacing: 40.h,
                          children: [
                            loginHeader(),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 20.h,
                              children: [
                                loginInputs(
                                  emailController: emailController,
                                  passwordController: passwordController,
                                  forgetPwFunc: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder:
                                          (context) => ForgetPasswordSheet(),
                                    );
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
                                  () => context.pushName(
                                    routeName: AppRoutesNames.signupScreen,
                                  ),
                              fingerPrintFunc: () {
                                // Handle Finger Print Function
                              },
                            ),
                          ],
                        ),
                        state is LoginLoadingState
                            ? Positioned(
                              top: 0,
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: Lottie.asset(AppImages.loading),
                              ),
                            )
                            : SizedBox.shrink(),
                      ],
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
