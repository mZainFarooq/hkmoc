import 'package:flutter/material.dart';

class CustomNavigation {
  // ✅ Push with result and optional RouteSettings
  static Future<T?> push<T>(
    BuildContext context,
    Widget page, {
    RouteSettings? settings,
  }) {
    return Navigator.push<T>(
      context,
      PageRouteBuilder(
        settings: settings, // optional
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
    );
  }

  // ✅ Replace with result and optional RouteSettings
  static Future<T?> replace<T>(
    BuildContext context,
    Widget page, {
    RouteSettings? settings,
  }) {
    return Navigator.pushReplacement<T, T>(
      context,
      PageRouteBuilder(
        settings: settings, // optional
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
    );
  }

  // ✅ Pop with result
  static void pop<T>(BuildContext context, [T? result]) {
    Navigator.pop<T>(context, result);
  }
}
