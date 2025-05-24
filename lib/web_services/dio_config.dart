import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:my_doctor/const/api_links/auth_api.dart';

class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic data;

  ApiException({required this.message, this.statusCode, this.data});

  @override
  String toString() =>
      'ApiException(message: $message, statusCode: $statusCode, data: $data)';
}

class DioClient {
  static const Duration _timeoutDuration = Duration(seconds: 30);

  final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: _timeoutDuration,
      receiveTimeout: _timeoutDuration,
      sendTimeout: _timeoutDuration,
      responseType: ResponseType.json,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      baseUrl: AuthApi.baseUrl,
    ),
  );

  Dio get dio {
    _dio.interceptors.clear();

    // Add interceptors
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // You can add auth token here if needed
          // final token = await _getToken();
          // if (token != null) {
          //   options.headers['Authorization'] = 'Bearer $token';
          // }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException error, handler) async {
          if (error.response != null) {
            // Handle different status codes
            switch (error.response?.statusCode) {
              case 400:
                return handler.reject(
                  DioException(
                    requestOptions: error.requestOptions,
                    response: error.response,
                    error: ApiException(
                      message: 'Bad Request',
                      statusCode: 400,
                      data: error.response?.data,
                    ),
                  ),
                );
              case 401:
                // Handle unauthorized (e.g., refresh token)
                return handler.reject(
                  DioException(
                    requestOptions: error.requestOptions,
                    response: error.response,
                    error: ApiException(
                      message: 'Unauthorized',
                      statusCode: 401,
                      data: error.response?.data,
                    ),
                  ),
                );
              case 403:
                return handler.reject(
                  DioException(
                    requestOptions: error.requestOptions,
                    response: error.response,
                    error: ApiException(
                      message: 'Forbidden',
                      statusCode: 403,
                      data: error.response?.data,
                    ),
                  ),
                );
              case 404:
                return handler.reject(
                  DioException(
                    requestOptions: error.requestOptions,
                    response: error.response,
                    error: ApiException(
                      message: 'Not Found',
                      statusCode: 404,
                      data: error.response?.data,
                    ),
                  ),
                );
              case 429:
                return handler.reject(
                  DioException(
                    requestOptions: error.requestOptions,
                    response: error.response,
                    error: ApiException(
                      message: 'Too Many Requests',
                      statusCode: 429,
                      data: error.response?.data,
                    ),
                  ),
                );
              case 500:
                return handler.reject(
                  DioException(
                    requestOptions: error.requestOptions,
                    response: error.response,
                    error: ApiException(
                      message: 'Internal Server Error',
                      statusCode: 500,
                      data: error.response?.data,
                    ),
                  ),
                );
              default:
                return handler.reject(
                  DioException(
                    requestOptions: error.requestOptions,
                    response: error.response,
                    error: ApiException(
                      message: 'An error occurred',
                      statusCode: error.response?.statusCode,
                      data: error.response?.data,
                    ),
                  ),
                );
            }
          } else if (error.type == DioExceptionType.connectionTimeout) {
            return handler.reject(
              DioException(
                requestOptions: error.requestOptions,
                error: ApiException(message: 'Connection timeout'),
              ),
            );
          } else if (error.type == DioExceptionType.receiveTimeout) {
            return handler.reject(
              DioException(
                requestOptions: error.requestOptions,
                error: ApiException(message: 'Receive timeout'),
              ),
            );
          } else if (error.type == DioExceptionType.sendTimeout) {
            return handler.reject(
              DioException(
                requestOptions: error.requestOptions,
                error: ApiException(message: 'Send timeout'),
              ),
            );
          } else if (error.error.toString().contains('SocketException')) {
            return handler.reject(
              DioException(
                requestOptions: error.requestOptions,
                error: ApiException(message: 'No internet connection'),
              ),
            );
          } else {
            return handler.reject(
              DioException(
                requestOptions: error.requestOptions,
                error: ApiException(message: 'An unexpected error occurred'),
              ),
            );
          }
        },
      ),
    );

    // Add logging interceptor in debug mode
    if (kDebugMode) {
      _dio.interceptors.add(
        LogInterceptor(
          request: true,
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          error: true,
        ),
      );
    }

    return _dio;
  }

  // Helper method to handle GET requests
  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.get(url, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      _handleDioError(e);
    } catch (e) {
      throw ApiException(message: 'An unexpected error occurred: $e');
    }
  }

  // Helper method to handle POST requests
  Future<dynamic> post(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      _handleDioError(e);
    } catch (e) {
      throw ApiException(message: 'An unexpected error occurred: $e');
    }
  }

  // Helper method to handle PUT requests
  Future<dynamic> put(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      _handleDioError(e);
    } catch (e) {
      throw ApiException(message: 'An unexpected error occurred: $e');
    }
  }

  // Helper method to handle DELETE requests
  Future<dynamic> delete(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      _handleDioError(e);
    } catch (e) {
      throw ApiException(message: 'An unexpected error occurred: $e');
    }
  }

  // Helper method to handle PATCH requests
  Future<dynamic> patch(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.patch(
        url,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      _handleDioError(e);
    } catch (e) {
      throw ApiException(message: 'An unexpected error occurred: $e');
    }
  }

  // Handle Dio specific errors
  void _handleDioError(DioException e) {
    if (e.response != null) {
      final data = e.response?.data;
      String message = 'An error occurred';

      if (data is Map<String, dynamic>) {
        message = data['message'] ?? data['error'] ?? message;
      } else if (data is String) {
        message = data;
      }

      throw ApiException(
        message: message,
        statusCode: e.response?.statusCode,
        data: data,
      );
    } else {
      throw ApiException(message: e.message ?? 'An error occurred');
    }
  }
}

// Global instance of the Dio client
final dioClient = DioClient();
