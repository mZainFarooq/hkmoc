import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/custom_navigation.dart';
import 'package:flutter_app/features/screens/dashboard/dashboard_screen.dart';
import 'package:flutter_app/features/widgets/custom_popup.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app/features/widgets/custom_text.dart';
import '../../../layout/auth_layout.dart';
import '../../widgets/custom_button.dart';
import '../../../core/constants/app_spacing.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_emailFocus);
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  void _handleLogin() {
    CustomNavigation.push(context, const DashboardScreen());
  }

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      title: "Login",
      isBackAction: false,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: AppSpacing.md.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: "Welcome back 👋",
              size: CustomTextSize.xl,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
            ),
            AppSpacing.vsm,
            CustomText(
              text: "Login to your account to manage your cleaning jobs.",
              size: CustomTextSize.sm,
              fontWeight: FontWeight.normal,
              color: CustomTextColor.textSecondary,
              textAlign: TextAlign.center,
            ),
            AppSpacing.vxl,

            // Email Field
            TextField(
              controller: _emailController,
              focusNode: _emailFocus,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                labelText: 'Email',
              ),
              style: TextStyle(fontSize: 16.sp),
            ),
            AppSpacing.vlg,

            // Password Field
            TextField(
              controller: _passwordController,
              focusNode: _passwordFocus,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                labelText: 'Password',
              ),
              style: TextStyle(fontSize: 16.sp),
            ),

            AppSpacing.vsm,

            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  CustomPopup.show(
                    context,
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CustomText(
                                text: "Select Password Reset Method",
                                size: CustomTextSize.md,
                                fontWeight: FontWeight.bold,
                              ),
                              AppSpacing.vxs,
                              const CustomText(
                                text:
                                    "Choose how you want to reset your password. You can do it yourself or ask an admin to change.",
                                size: CustomTextSize.sm,
                                color: CustomTextColor.textSecondary,
                              ),
                            ],
                          ),
                        ),
                        AppSpacing.vmd,
                        CustomButton(
                          text: "Reset Myself",
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),

                        AppSpacing.vsm,
                        CustomButton(
                          text: "You want to change by Admin?",
                          variant: ButtonVariant.outline,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                },
                child: const CustomText(
                  text: "Forgot your password ?",
                  size: CustomTextSize.sm,
                  color: CustomTextColor.textSecondary,
                ),
              ),
            ),

            AppSpacing.vxl,

            SizedBox(
              width: double.infinity,
              child: CustomButton(
                text: 'Login & Start Work',
                onPressed: _handleLogin,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
