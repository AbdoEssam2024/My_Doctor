import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_doctor/const/class/app_initializer.dart';
import 'package:my_doctor/const/functions/navigation_extenstion.dart';
import 'package:my_doctor/const/routes/routes_names.dart';
import 'package:my_doctor/controller/login_controller/login_state.dart';
import 'package:my_doctor/model/user_data_model.dart';
import 'package:my_doctor/repository/auth_repo/login_repo.dart';
import 'package:my_doctor/view/core_widgets/custom_dialog.dart';
import 'package:my_doctor/web_services/dio_config.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginRepo loginRepo = LoginRepo(dioClient: DioClient());

  LoginCubit() : super(LoginState(showPass: true));

  void toggleShowPass() {
    emit(ShowPassState(showPass: !state.showPass));
  }

  void loginFunc({
    required String email,
    required String password,
    required BuildContext context,
    required GlobalKey<FormState> formKey,
  }) async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoadingState(showPass: state.showPass));
      try {
        final response = await loginRepo.login(email, password);
        
        if (response is List<UserDataModel>) {
          final userData = {
            "token": response.first.token,
            "userId": response.first.userId,
            "name": response.first.name,
            "email": response.first.email,
          };
          AppInitializer.userDataBox.put("user", userData);
          context.pushNameAndRemove(routeName: AppRoutesNames.homeScreen);
          emit(LoginSuccessState(userData: response, showPass: state.showPass));
        } else if (response is ApiException) {
          customDialog(context: context, body: response.message);
          emit(
            LoginErrorState(
              message: response.message,
              showPass: state.showPass,
            ),
          );
        }
      } catch (e) {
        customDialog(context: context, body: e.toString());
        emit(LoginErrorState(message: e.toString(), showPass: state.showPass));
      }
    }
  }
}
