import 'package:my_doctor/model/user_data_model.dart';

class LoginState {
  final bool showPass;
  const LoginState({required this.showPass});
}

class ShowPassState extends LoginState {
  const ShowPassState({super.showPass = true});
}

class LoginLoadingState extends LoginState {
  const LoginLoadingState({super.showPass = false});
}

class LoginErrorState extends LoginState {
  final String message;
  const LoginErrorState({required this.message, super.showPass = false});
}

class LoginSuccessState extends LoginState {
  final List<UserDataModel> userData;
  const LoginSuccessState({required this.userData, super.showPass = false});
}
