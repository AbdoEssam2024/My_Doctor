import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_doctor/controller/signup_controller/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupState(showPass: true));

  void toggleShowPass() {
    emit(ShowPassState(showPass: !state.showPass));
  }
}
