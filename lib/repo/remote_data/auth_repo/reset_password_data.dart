import 'package:my_doctor/const/api_links/auth_api.dart';
import 'package:my_doctor/web_services/api_calls.dart';

class ResetPasswordData {
  final ApiCalls apiCalls;

  ResetPasswordData({required this.apiCalls});
  resetUserPassword({required String email, required String password}) async {
    var response = await apiCalls.postData(
      apiLink: AuthApi.resetPwApi,
      data: {"useremail": email, "userpassword": password},
    );
    if (response.isRight) {
      var userData = response.right;
      return userData;
    } else {
      return response.left;
    }
  }
}
