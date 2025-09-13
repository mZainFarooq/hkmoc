import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/app_spacing.dart';
import 'package:flutter_app/features/widgets/custom_button.dart';
import 'package:flutter_app/features/widgets/custom_text.dart';
import 'package:flutter_app/l10n/app_localizations.dart';
import 'package:flutter_app/layout/main_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return MainLayout(
      title: loc.privacyPolicyScreenTitle,
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
              text: loc.privacyPolicyScreenTitle,
              size: CustomTextSize.lg,
              fontWeight: FontWeight.bold,
              color: CustomTextColor.primary,
            ),
            AppSpacing.vlg,

            CustomText(
              text: loc.privacyPolicyScreenData,
              size: CustomTextSize.sm,
              color: CustomTextColor.text,
            ),

            AppSpacing.vlg,

            SizedBox(
              width: double.infinity,
              child: CustomButton(
                text: loc.privacyPolicyScreenAcceptButton,
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
