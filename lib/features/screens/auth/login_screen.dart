import 'package:flutter/material.dart';
import 'package:flutter_app/features/screens/dashboard/dashboard_screen.dart';
import 'package:flutter_app/features/widgets/custom_popup.dart';
import 'package:flutter_app/features/widgets/custom_text.dart';
import 'package:flutter_app/provider/language_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
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
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const DashboardScreen()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final helper = languageProvider.helper;

    return AuthLayout(
      title: helper?.tr('login_screen.screen_title') ?? '',
      isBackAction: false,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: AppSpacing.md.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: helper?.tr('login_screen.welcome') ?? '',
              size: CustomTextSize.lg,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
            ),
            AppSpacing.vsm,
            CustomText(
              text: helper?.tr('login_screen.login_desc') ?? '',
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
                labelText: helper?.tr('login_screen.email_label') ?? '',
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
                labelText: helper?.tr('login_screen.password_label') ?? '',
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
                                        helper?.tr(
                                          'login_screen.reset_method_title',
                                        ) ??
                                        '',
                                    size: CustomTextSize.md,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  AppSpacing.vxs,
                                  CustomText(
                                    text:
                                        helper?.tr(
                                          'login_screen.reset_method_description',
                                        ) ??
                                        '',
                                    size: CustomTextSize.sm,
                                    color: CustomTextColor.textSecondary,
                                  ),
                                ],
                              ),
                            ),
                            AppSpacing.vmd,
                            CustomButton(
                              text:
                                  helper?.tr('login_screen.reset_myself') ?? '',
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            AppSpacing.vsm,
                            CustomButton(
                              text:
                                  helper?.tr('login_screen.reset_by_admin') ??
                                  '',
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
                  text: helper?.tr('login_screen.forgot_password') ?? '',
                  size: CustomTextSize.sm,
                  color: CustomTextColor.textSecondary,
                ),
              ),
            ),

            AppSpacing.vxl,

            SizedBox(
              width: double.infinity,
              child: CustomButton(
                text: helper?.tr('login_screen.login_button') ?? '',

                onPressed: _handleLogin,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
