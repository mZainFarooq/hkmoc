import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/app_spacing.dart';
import 'package:flutter_app/features/widgets/custom_text.dart';
import 'package:flutter_app/features/widgets/custom_button.dart';
import 'package:flutter_app/l10n/app_localizations.dart';
import 'package:flutter_app/layout/main_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return MainLayout(
      title: loc.termsNConditionsScreenTitle,
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
              text: loc.termsNConditionsScreenTitle,
              size: CustomTextSize.lg,
              fontWeight: FontWeight.bold,
              color: CustomTextColor.primary,
            ),
            AppSpacing.vxs,

            // Intro
            CustomText(
              text: loc.termsNConditionsIntro,
              size: CustomTextSize.sm,
              color: CustomTextColor.text,
            ),
            AppSpacing.md.verticalSpace,

            // Section 1
            _buildSection(
              loc.termsNConditionsSection1Title,
              loc.termsNConditionsSection1Content,
            ),
            // Section 2
            _buildSection(
              loc.termsNConditionsSection2Title,
              loc.termsNConditionsSection2Content,
            ),
            // Section 3
            _buildSection(
              loc.termsNConditionsSection3Title,
              loc.termsNConditionsSection3Content,
            ),
            // Section 4
            _buildSection(
              loc.termsNConditionsSection4Title,
              loc.termsNConditionsSection4Content,
            ),
            // Section 5
            _buildSection(
              loc.termsNConditionsSection5Title,
              loc.termsNConditionsSection5Content,
            ),
            // Section 6
            _buildSection(
              loc.termsNConditionsSection6Title,
              loc.termsNConditionsSection6Content,
            ),
            // Section 7
            _buildSection(
              loc.termsNConditionsSection7Title,
              loc.termsNConditionsSection7Content,
            ),

            AppSpacing.vlg,

            // Accept Button
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                text: loc.termsNConditionsAcceptButton,
                onPressed: () => Navigator.pop(context),
                variant: ButtonVariant.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          size: CustomTextSize.md,
          fontWeight: FontWeight.w600,
          color: CustomTextColor.primary,
        ),
        AppSpacing.vsm,
        CustomText(
          text: content,
          size: CustomTextSize.sm,
          color: CustomTextColor.text,
        ),
        AppSpacing.vmd,
      ],
    );
  }
}
