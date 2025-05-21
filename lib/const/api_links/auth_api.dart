/// A class containing static URLs for authentication-related API endpoints.
///
/// This class provides static string variables that represent the base URL
/// and specific endpoints for login, sign-up, verification, and password
/// reset functionalities.
class AuthApi {
  // Base Url
  static String baseUrl = "http://10.0.2.2:8000/";

  // Auth Endpoints
  static String loginApi = "user/login";
  static String signUpApi = "user/register";
  static String deleteUser = "user/delete_user";
  static String getUserInfo = "user/get_user";
  static String updateUserInfo = "user/update_user";
  static String verifyUser = "user/verify_user";
}
