import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/app_spacing.dart';
import 'package:flutter_app/features/widgets/custom_text.dart';
import 'package:flutter_app/features/widgets/custom_button.dart';
import 'package:flutter_app/layout/main_layout.dart';
import 'package:flutter_app/provider/language_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final helper = languageProvider.helper;

    return MainLayout(
      title: helper?.tr('terms_n_conditions.screen_title') ?? '',
      isBackAction: true,
      showBottomNav: false,
      currentIndex: 0,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.lg.w,
          vertical: AppSpacing.md.h,
        ),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            CustomText(
              text: helper?.tr('terms_n_conditions.screen_title') ?? '',
              size: CustomTextSize.lg,
              fontWeight: FontWeight.bold,
              color: CustomTextColor.primary,
            ),
            AppSpacing.vxs,

            // Intro
            CustomText(
              text: helper?.tr('terms_n_conditions.intro') ?? '',
              size: CustomTextSize.sm,
              color: CustomTextColor.text,
            ),
            AppSpacing.md.verticalSpace,

            // Section 1
            CustomText(
              text: helper?.tr('terms_n_conditions.section_1_title') ?? '',
              size: CustomTextSize.lg,
              fontWeight: FontWeight.w600,
              color: CustomTextColor.primary,
            ),
            AppSpacing.sm.verticalSpace,
            CustomText(
              text: helper?.tr('terms_n_conditions.section_1_content') ?? '',
              size: CustomTextSize.sm,
              color: CustomTextColor.text,
            ),
            AppSpacing.md.verticalSpace,

            // Section 2
            CustomText(
              text: helper?.tr('terms_n_conditions.section_2_title') ?? '',
              size: CustomTextSize.lg,
              fontWeight: FontWeight.w600,
              color: CustomTextColor.primary,
            ),
            AppSpacing.sm.verticalSpace,
            CustomText(
              text: helper?.tr('terms_n_conditions.section_2_content') ?? '',
              size: CustomTextSize.sm,
              color: CustomTextColor.text,
            ),
            AppSpacing.md.verticalSpace,

            // Section 3
            CustomText(
              text: helper?.tr('terms_n_conditions.section_3_title') ?? '',
              size: CustomTextSize.lg,
              fontWeight: FontWeight.w600,
              color: CustomTextColor.primary,
            ),
            AppSpacing.sm.verticalSpace,
            CustomText(
              text: helper?.tr('terms_n_conditions.section_3_content') ?? '',
              size: CustomTextSize.sm,
              color: CustomTextColor.text,
            ),
            AppSpacing.md.verticalSpace,

            // Section 4
            CustomText(
              text: helper?.tr('terms_n_conditions.section_4_title') ?? '',
              size: CustomTextSize.lg,
              fontWeight: FontWeight.w600,
              color: CustomTextColor.primary,
            ),
            AppSpacing.sm.verticalSpace,
            CustomText(
              text: helper?.tr('terms_n_conditions.section_4_content') ?? '',
              size: CustomTextSize.sm,
              color: CustomTextColor.text,
            ),
            AppSpacing.md.verticalSpace,

            // Section 5
            CustomText(
              text: helper?.tr('terms_n_conditions.section_5_title') ?? '',
              size: CustomTextSize.lg,
              fontWeight: FontWeight.w600,
              color: CustomTextColor.primary,
            ),
            AppSpacing.sm.verticalSpace,
            CustomText(
              text: helper?.tr('terms_n_conditions.section_5_content') ?? '',
              size: CustomTextSize.sm,
              color: CustomTextColor.text,
            ),
            AppSpacing.md.verticalSpace,

            // Section 6
            CustomText(
              text: helper?.tr('terms_n_conditions.section_6_title') ?? '',
              size: CustomTextSize.lg,
              fontWeight: FontWeight.w600,
              color: CustomTextColor.primary,
            ),
            AppSpacing.sm.verticalSpace,
            CustomText(
              text: helper?.tr('terms_n_conditions.section_6_content') ?? '',
              size: CustomTextSize.sm,
              color: CustomTextColor.text,
            ),
            AppSpacing.md.verticalSpace,

            // Section 7
            CustomText(
              text: helper?.tr('terms_n_conditions.section_7_title') ?? '',
              size: CustomTextSize.lg,
              fontWeight: FontWeight.w600,
              color: CustomTextColor.primary,
            ),
            AppSpacing.sm.verticalSpace,
            CustomText(
              text: helper?.tr('terms_n_conditions.section_7_content') ?? '',
              size: CustomTextSize.sm,
              color: CustomTextColor.text,
            ),
            AppSpacing.vlg,

            // Accept Button
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                text: helper?.tr('terms_n_conditions.accept_button') ?? '',
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
