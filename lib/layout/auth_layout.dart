import 'package:flutter/material.dart';
import '../features/widgets/custom_app_bar.dart';

class AuthLayout extends StatelessWidget {
  final Widget body;
  final String title;
  final bool isBackAction;
  final bool isNotficationIcon;

  const AuthLayout({
    super.key,
    required this.body,
    required this.title,
    this.isBackAction = true,
    this.isNotficationIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: title,
        isBackAction: isBackAction,
        isNotficationIcon: isNotficationIcon,
      ),
      body: SafeArea(child: body),
    );
  }
}
