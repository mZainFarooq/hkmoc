import 'package:flutter/material.dart';

class FullScreenLoader {
  static final _loader = GlobalKey<State>();

  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black54,
      builder: (ctx) {
        return Center(key: _loader, child: const CircularProgressIndicator());
      },
    );
  }

  static void hide(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }
}
