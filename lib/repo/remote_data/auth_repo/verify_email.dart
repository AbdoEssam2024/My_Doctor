import 'package:my_doctor/const/api_links/auth_api.dart';
import 'package:my_doctor/web_services/api_calls.dart';

class VerifyEmail {
  final ApiCalls apiCalls;

  VerifyEmail({required this.apiCalls});
  Future<dynamic> verifyEmailData({
    required String email,
    required int code,
  }) async {
    var response = await apiCalls.postData(
      apiLink: AuthApi.verifySignUpApi,
      data: {"useremail": email, "verifycode": code.toString()},
    );
    if (response.isRight) {
      var userData = response.right;
      return userData;
    } else {
      return response.left;
    }
  }
}
