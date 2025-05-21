import 'dart:convert';
import 'dart:io';
import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import 'package:my_doctor/const/class/request_state.dart';

class ApiCalls {
  Future<Either<RequestState, Map>> postData({
    required String apiLink,
    required Map data,
  }) async {
    try {
      var response = await http.post(Uri.parse(apiLink), body: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(jsonDecode(response.body));
      } else {
        return Left(RequestState.failed);
      }
    } on SocketException {
      return Left(RequestState.error);
    } catch (e) {
      return Left(RequestState.error);
    }
  }
}