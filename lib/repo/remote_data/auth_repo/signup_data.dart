import 'package:my_doctor/const/api_links/auth_api.dart';
import 'package:my_doctor/web_services/api_calls.dart';

class SignUpUserData {
  final ApiCalls apiCalls;

  SignUpUserData({required this.apiCalls});
  signUpUserData({
    required String username,
    required String usermobile,
    required String userbirth,
    required String usergender,
    required String email,
    required String password,
  }) async {
    var response = await apiCalls.postData(
      apiLink: AuthApi.signUpApi,
      data: {
        "username": username,
        "userpassword": password,
        "useremail": email,
        "usermobile": usermobile,
        "userbirth": userbirth,
        "usergender": usergender,
      },
    );

    if (response.isRight) {
      var userData = response.right;
      return userData;
    } else {
      return response.left;
    }
  }
}
