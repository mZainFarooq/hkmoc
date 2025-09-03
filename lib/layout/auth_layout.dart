import 'package:flutter/material.dart';
import '../features/widgets/custom_app_bar.dart';

class AuthLayout extends StatelessWidget {
  final Widget body;
  final String title;
  final bool isBackAction;

  const AuthLayout({
    super.key,
    required this.body,
    required this.title,
    this.isBackAction = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: title, isBackAction: isBackAction),
      body: SafeArea(child: body),
    );
  }
}
