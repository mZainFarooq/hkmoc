import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/app_spacing.dart';
import 'package:flutter_app/features/widgets/custom_text.dart';
import 'package:flutter_app/layout/main_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app/l10n/app_localizations.dart';

class HelpAndSupportScreen extends StatelessWidget {
  const HelpAndSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    return MainLayout(
      title: local.helpNSupportScreenScreenTitle,
      isBackAction: true,
      currentIndex: 4,
      showBottomNav: false,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: local.helpNSupportScreenScreenTitle,
              size: CustomTextSize.lg,
              fontWeight: FontWeight.bold,
              color: CustomTextColor.text,
            ),
            AppSpacing.vmd,
            CustomText(
              text: local.helpNSupportScreenNeedHelpDescription,
              size: CustomTextSize.sm,
              color: CustomTextColor.text,
            ),
            AppSpacing.vlg,

            CustomText(
              text: local.helpNSupportScreenContactUsTitle,
              size: CustomTextSize.lg,
              fontWeight: FontWeight.w600,
              color: CustomTextColor.primary,
            ),
            AppSpacing.vsm,
            CustomText(
              text: local.helpNSupportScreenContactUsDescription,
              size: CustomTextSize.sm,
              color: CustomTextColor.text,
            ),
            AppSpacing.vsm,
            CustomText(
              text: local.helpNSupportScreenEmail,
              size: CustomTextSize.sm,
              color: CustomTextColor.primary,
            ),
            AppSpacing.vxs,
            CustomText(
              text: local.helpNSupportScreenPhone,
              size: CustomTextSize.sm,
              color: CustomTextColor.primary,
            ),
            AppSpacing.vxs,
            CustomText(
              text: local.helpNSupportScreenChat,
              size: CustomTextSize.sm,
              color: CustomTextColor.primary,
            ),

            AppSpacing.vlg,
            CustomText(
              text: local.helpNSupportScreenAdditionalTipsTitle,
              size: CustomTextSize.lg,
              fontWeight: FontWeight.w600,
              color: CustomTextColor.primary,
            ),
            AppSpacing.vsm,
            CustomText(
              text: local.helpNSupportScreenAdditionalTips,
              size: CustomTextSize.sm,
              color: CustomTextColor.text,
            ),
            AppSpacing.vxxl,
          ],
        ),
      ),
    );
  }
}
