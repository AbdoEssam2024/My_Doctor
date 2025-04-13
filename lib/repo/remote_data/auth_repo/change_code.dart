import 'package:my_doctor/const/api_links/auth_api.dart';
import 'package:my_doctor/web_services/api_calls.dart';

class ChangeVerifyCode {
  final ApiCalls apiCalls;

  ChangeVerifyCode({required this.apiCalls});
  Future<dynamic> changeVerifyCode({
    required String email,
  }) async {
    var response = await apiCalls.postData(
      apiLink: AuthApi.changeVerifyCodeApi,
      data: {"useremail": email},
    );
    if (response.isRight) {
      var userData = response.right;
      return userData;
    } else {
      return response.left;
    }
  }
}
