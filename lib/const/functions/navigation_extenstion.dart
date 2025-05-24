import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  void pushName({required String routeName , Object? arguments}) {
    Navigator.pushNamed(this, routeName , arguments: arguments);
  }

  void pushNameAndRemove({required String routeName , Object? arguments}) {
    Navigator.pushNamedAndRemoveUntil(this, routeName, (route) => false , arguments: arguments);
  }

  void pop() {
    Navigator.pop(this);
  }
}