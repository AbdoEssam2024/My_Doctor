/// A class containing static URLs for authentication-related API endpoints.
///
/// This class provides static string variables that represent the base URL
/// and specific endpoints for login, sign-up, verification, and password
/// reset functionalities.
class AuthApi {
  static String baseUrl = "http://10.0.2.2:8000/user/";
  static String loginApi = "${baseUrl}login";
  static String signUpApi = "${baseUrl}register";
  static String deleteUser = "${baseUrl}delete_user";
  static String getUserInfo = "${baseUrl}get_user";
  static String updateUserInfo = "${baseUrl}update_user";
  static String verifyUser = "${baseUrl}verify_user";
}
