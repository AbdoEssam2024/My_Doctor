import 'dart:io';
import 'package:my_doctor/const/api_links/auth_api.dart';
import 'package:my_doctor/web_services/api_calls.dart';

class LoginUserData {
  final ApiCalls apiCalls;

  LoginUserData({required this.apiCalls});
  getUserData({required String email, required String password}) async {
    try {
      var response = await apiCalls.postData(
        apiLink: AuthApi.loginApi,
        data: {"useremail": email, "userpassword": password},
      );
      if (response.isRight) {
        var userData = response.right;
        return userData;
      } else {
        return response.left;
      }
    } on SocketException {
      return null;
    } catch (e) {
      return null;
    }
  }
}