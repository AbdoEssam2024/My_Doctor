class SignupState {
  final bool showPass;
  const SignupState({required this.showPass});
}

class ShowPassState extends SignupState {
  const ShowPassState({super.showPass = true});
}