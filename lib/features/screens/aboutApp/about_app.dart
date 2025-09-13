import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/app_spacing.dart';
import 'package:flutter_app/features/widgets/custom_text.dart';
import 'package:flutter_app/layout/main_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app/l10n/app_localizations.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;

    final features = [
      {
        "title": local.aboutAppScreenFeature0Title,
        "description": local.aboutAppScreenFeature0Description,
      },
      {
        "title": local.aboutAppScreenFeature1Title,
        "description": local.aboutAppScreenFeature1Description,
      },
      {
        "title": local.aboutAppScreenFeature2Title,
        "description": local.aboutAppScreenFeature2Description,
      },
      {
        "title": local.aboutAppScreenFeature3Title,
        "description": local.aboutAppScreenFeature3Description,
      },
      {
        "title": local.aboutAppScreenFeature4Title,
        "description": local.aboutAppScreenFeature4Description,
      },
    ];

    return MainLayout(
      currentIndex: 4,
      title: local.aboutAppScreenScreenTitle,
      isBackAction: true,
      showBottomNav: false,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSpacing.md.w),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App Name
            CustomText(
              text: local.aboutAppScreenAppName,
              size: CustomTextSize.lg,
              fontWeight: FontWeight.bold,
              color: CustomTextColor.text,
            ),
            AppSpacing.vmd,

            // Description
            CustomText(
              text: local.aboutAppScreenDescription,
              size: CustomTextSize.sm,
              color: CustomTextColor.text,
            ),
            AppSpacing.vlg,

            // Features Title
            CustomText(
              text: local.aboutAppScreenFeaturesTitle,
              size: CustomTextSize.lg,
              fontWeight: FontWeight.w600,
              color: CustomTextColor.primary,
            ),
            AppSpacing.vsm,

            // Features List
            ...features.map(
              (f) => _buildFeatureItem(f["title"]!, f["description"]!),
            ),

            AppSpacing.vlg,

            // Version
            CustomText(
              text: local.aboutAppScreenVersion,
              fontSize: 12.sp,
              color: CustomTextColor.primary,
            ),
            AppSpacing.vsm,

            // Developed By
            CustomText(
              text: local.aboutAppScreenDevelopedBy,
              fontSize: 14.sp,
              color: CustomTextColor.textSecondary,
            ),
            AppSpacing.vxxl,
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(String title, String description) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSpacing.sm.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: "• $title",
            size: CustomTextSize.md,
            fontWeight: FontWeight.w600,
            color: CustomTextColor.text,
          ),
          AppSpacing.vxs,
          CustomText(
            text: description,
            size: CustomTextSize.sm,
            color: CustomTextColor.textSecondary,
          ),
        ],
      ),
    );
  }
}
