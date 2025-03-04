import 'package:flutter/material.dart';

extension NavigationX on BuildContext {
  Future<T?> pushNamed<T>(String route, [Object? arguments]) {
    return Navigator.of(this).pushNamed<T>(route, arguments: arguments);
  }

  Future<T?> pushReplacementNamed<T>(String route, [Object? arguments]) {
    return Navigator.of(this).pushReplacementNamed<T, void>(
      route,
      arguments: arguments,
    );
  }

  void pop<T>([T? result]) {
    Navigator.of(this).pop<T>(result);
  }

  Future<T?> pushNamedAndRemoveUntil<T>(String route, [Object? arguments]) {
    return Navigator.of(this).pushNamedAndRemoveUntil<T>(
      route,
      (route) => false,
      arguments: arguments,
    );
  }
} 