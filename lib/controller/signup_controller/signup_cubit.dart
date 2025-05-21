import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_doctor/const/routes/routes_names.dart';
import 'package:my_doctor/controller/signup_controller/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupState(showPass: false));

  void toggleShowPass() {
    emit(ShowPassState(showPass: !state.showPass));
  }

  void goToLoginPage(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutesNames.loginScreen,
      (route) => false,
    );
  }
}
