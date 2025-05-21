import 'package:my_doctor/const/api_links/auth_api.dart';
import 'package:my_doctor/model/user_data_model.dart';
import 'package:my_doctor/web_services/dio_config.dart';

class LoginRepo {
  final DioClient dioClient;

  LoginRepo({required this.dioClient});

  Future<dynamic> login(String email, String password) async {
    try {
      final response = await dioClient.dio.post(
        AuthApi.loginApi,
        data: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        if (response.data['status'] == 'success') {
          List data = [response.data];
          List<UserDataModel> userData =
              data.map((user) => UserDataModel.fromJson(user)).toList();
          return userData;
        } else {
          return response.data['message'];
        }
      } else {
        throw ApiException(message: 'Login failed');
      }
    } catch (e) {
      throw ApiException(message: 'Login failed');
    }
  }
}
