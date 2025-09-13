import 'package:flutter/material.dart';
import 'package:flutter_app/features/screens/dashboard/dashboard_screen.dart';
import 'package:flutter_app/features/widgets/custom_popup.dart';
import 'package:flutter_app/features/widgets/custom_text.dart';
import 'package:flutter_app/l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../layout/auth_layout.dart';
import '../../widgets/custom_button.dart';
import '../../../core/constants/app_spacing.dart';

// Example

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
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const DashboardScreen()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      title: AppLocalizations.of(context)!.loginScreenScreenTitle,
      isBackAction: false,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: AppSpacing.md.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: AppLocalizations.of(context)!.loginScreenWelcome,
              size: CustomTextSize.lg,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
            ),
            AppSpacing.vsm,
            CustomText(
              text: AppLocalizations.of(context)!.loginScreenLoginDesc,
              size: CustomTextSize.sm,
              fontWeight: FontWeight.normal,
              color: CustomTextColor.textSecondary,
              textAlign: TextAlign.center,
            ),
            AppSpacing.vxl,
            TextField(
              controller: _emailController,
              focusNode: _emailFocus,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                labelText: AppLocalizations.of(context)!.loginScreenEmailLabel,
              ),
              style: TextStyle(fontSize: 16.sp),
            ),
            AppSpacing.vlg,

            TextField(
              controller: _passwordController,
              focusNode: _passwordFocus,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                labelText:
                    AppLocalizations.of(context)!.loginScreenPasswordLabel,
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
                    content: IntrinsicWidth(
                      child: IntrinsicHeight(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: AppSpacing.xs.h,
                                vertical: AppSpacing.xs.w,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text:
                                        AppLocalizations.of(
                                          context,
                                        )!.loginScreenResetMethodTitle,
                                    size: CustomTextSize.md,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  AppSpacing.vxs,
                                ],
                              ),
                            ),
                            AppSpacing.vmd,
                            CustomButton(
                              text:
                                  AppLocalizations.of(
                                    context,
                                  )!.loginScreenResetMyself,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            AppSpacing.vsm,
                            CustomButton(
                              text:
                                  AppLocalizations.of(
                                    context,
                                  )!.loginScreenResetByAdmin,
                              variant: ButtonVariant.outline,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                child: CustomText(
                  text: AppLocalizations.of(context)!.loginScreenForgotPassword,
                  size: CustomTextSize.sm,
                  color: CustomTextColor.textSecondary,
                ),
              ),
            ),
            AppSpacing.vxl,
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                text: AppLocalizations.of(context)!.loginScreenLoginButton,

                onPressed: _handleLogin,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
