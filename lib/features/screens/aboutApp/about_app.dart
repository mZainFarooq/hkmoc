import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/app_spacing.dart';
import 'package:flutter_app/features/widgets/custom_text.dart';
import 'package:flutter_app/layout/main_layout.dart';
import 'package:flutter_app/provider/language_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final helper = languageProvider.helper;

    final features = [
      {
        "title": helper?.tr("about_app_screen.feature_0_title") ?? "",
        "description":
            helper?.tr("about_app_screen.feature_0_description") ?? "",
      },
      {
        "title": helper?.tr("about_app_screen.feature_1_title") ?? "",
        "description":
            helper?.tr("about_app_screen.feature_1_description") ?? "",
      },
      {
        "title": helper?.tr("about_app_screen.feature_2_title") ?? "",
        "description":
            helper?.tr("about_app_screen.feature_2_description") ?? "",
      },
      {
        "title": helper?.tr("about_app_screen.feature_3_title") ?? "",
        "description":
            helper?.tr("about_app_screen.feature_3_description") ?? "",
      },
      {
        "title": helper?.tr("about_app_screen.feature_4_title") ?? "",
        "description":
            helper?.tr("about_app_screen.feature_4_description") ?? "",
      },
    ];

    return MainLayout(
      currentIndex: 4,
      title: helper?.tr("about_app_screen.screen_title") ?? "",
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
              text: helper?.tr("about_app_screen.app_name") ?? "",
              size: CustomTextSize.lg,
              fontWeight: FontWeight.bold,
              color: CustomTextColor.text,
            ),
            AppSpacing.vmd,

            // Description
            CustomText(
              text: helper?.tr("about_app_screen.description") ?? "",
              size: CustomTextSize.sm,
              color: CustomTextColor.text,
            ),
            AppSpacing.vlg,

            // Features Title
            CustomText(
              text: helper?.tr("about_app_screen.features_title") ?? "",
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
              text: helper?.tr("about_app_screen.version") ?? "",
              fontSize: 12.sp,
              color: CustomTextColor.primary,
            ),
            AppSpacing.vsm,

            // Developed By
            CustomText(
              text: helper?.tr("about_app_screen.developed_by") ?? "",
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
