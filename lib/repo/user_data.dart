import 'package:my_doctor/const/api_links/auth_api.dart';
import 'package:my_doctor/const/class/request_state.dart';
import 'package:my_doctor/web_services/api_calls.dart';

class UserData {
  final ApiCalls apiCalls;

  UserData({required this.apiCalls});
  getUserData({required String email, required String password}) async {
    var response = await apiCalls.postData(
      apiLink: AuthApi.loginApi,
      data: {"useremail": email, "userpassword": password},
    );

    if (response.isRight) {
      if (response.right['status'] == "success") {
        response.fold((l) => l, (r) => r);
        return response.right['data'];
      } else {
        return RequestState.failed;
      }
    } else {
      return response.left;
    }
  }
}
