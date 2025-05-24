import 'package:dio/dio.dart';
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
          return ApiException(
            message: response.data['message'],
            statusCode: response.statusCode,
            data: response.data,
          );
        }
      } else {
        return ApiException(
          message: response.data['message'],
          statusCode: response.statusCode,
          data: response.data,
        );
      }
    } catch (e) {
      String message = "An unexpected error occurred";
      if (e is DioException) {
        if (e.error is ApiException) {
          message = (e.error as ApiException).message;
        } else if (e.response?.data is Map<String, dynamic>) {
          message = e.response?.data['message'] ?? e.message ?? message;
        }
        return ApiException(message: message);
      } else if (e is ApiException) {
        message = e.message;
      }
      return ApiException(message: message);
    }
  }
}
