import 'package:flutter/widgets.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';
import 'package:my_doctor/const/routes/routes_names.dart';
import 'package:my_doctor/main.dart';

/// A middleware class that handles redirection based on the user's visit count.
///
/// This middleware checks the value of the "visit" key in shared preferences
/// to determine which route to redirect the user to:
/// - If the visit count is 0, redirects to the welcome page.
/// - If the visit count is 1, redirects to the login screen.
/// - If the visit count is 2, redirects to the home screen.
///
/// If none of these conditions are met, it falls back to the default redirection
/// behavior provided by the superclass.

class SplashMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (userDataBox.get("visit") == 0) {
      return RouteSettings(name: AppRoutesNames.welcomePage);
    }
    if (userDataBox.get("visit") == 1) {
      return RouteSettings(name: AppRoutesNames.loginScreen);
    }
    if (userDataBox.get("visit") == 2) {
      return RouteSettings(name: AppRoutesNames.homeScreen);
    }

    return super.redirect(route);
  }
}
