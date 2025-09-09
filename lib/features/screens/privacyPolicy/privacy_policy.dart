import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/app_spacing.dart';
import 'package:flutter_app/features/widgets/custom_button.dart';
import 'package:flutter_app/features/widgets/custom_text.dart';
import 'package:flutter_app/layout/main_layout.dart';
import 'package:flutter_app/provider/language_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final helper = languageProvider.helper;

    return MainLayout(
      title: helper?.tr('privacy_policy_screen.title') ?? '',
      isBackAction: true,
      currentIndex: 0,
      showBottomNav: false,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.lg.w,
          vertical: AppSpacing.md.h,
        ),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: helper?.tr('privacy_policy_screen.title') ?? '',
              size: CustomTextSize.lg,
              fontWeight: FontWeight.bold,
              color: CustomTextColor.primary,
            ),
            SizedBox(height: AppSpacing.lg.h),

            CustomText(
              text: helper?.tr('privacy_policy_screen.data') ?? '',
              size: CustomTextSize.sm,
              color: CustomTextColor.text,
            ),

            SizedBox(height: AppSpacing.lg.h),

            SizedBox(
              width: double.infinity,
              child: CustomButton(
                text: helper?.tr('privacy_policy_screen.accept_button') ?? '',
                onPressed: () => Navigator.pop(context),
                variant: ButtonVariant.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
