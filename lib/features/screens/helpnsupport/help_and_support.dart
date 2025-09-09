import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/app_spacing.dart';
import 'package:flutter_app/features/widgets/custom_text.dart';
import 'package:flutter_app/layout/main_layout.dart';
import 'package:flutter_app/provider/language_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HelpAndSupportScreen extends StatelessWidget {
  const HelpAndSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final helper = languageProvider.helper;

    return MainLayout(
      title: helper?.tr("help_n_support_screen.screen_title") ?? "",
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
              text: helper?.tr("help_n_support_screen.need_help_title") ?? "",
              size: CustomTextSize.xl,
              fontWeight: FontWeight.bold,
              color: CustomTextColor.text,
            ),
            AppSpacing.vmd,
            CustomText(
              text:
                  helper?.tr("help_n_support_screen.need_help_description") ??
                  "",
              size: CustomTextSize.sm,
              color: CustomTextColor.text,
            ),
            AppSpacing.vlg,

            CustomText(
              text: helper?.tr("help_n_support_screen.contact_us_title") ?? "",
              size: CustomTextSize.lg,
              fontWeight: FontWeight.w600,
              color: CustomTextColor.primary,
            ),
            AppSpacing.vsm,
            CustomText(
              text:
                  helper?.tr("help_n_support_screen.contact_us_description") ??
                  "",
              size: CustomTextSize.sm,
              color: CustomTextColor.text,
            ),
            AppSpacing.vsm,
            CustomText(
              text: helper?.tr("help_n_support_screen.email") ?? "",
              size: CustomTextSize.sm,
              color: CustomTextColor.primary,
            ),
            AppSpacing.vxs,
            CustomText(
              text: helper?.tr("help_n_support_screen.phone") ?? "",
              size: CustomTextSize.sm,
              color: CustomTextColor.primary,
            ),
            AppSpacing.vxs,
            CustomText(
              text: helper?.tr("help_n_support_screen.chat") ?? "",
              size: CustomTextSize.sm,
              color: CustomTextColor.primary,
            ),

            AppSpacing.vlg,
            CustomText(
              text:
                  helper?.tr("help_n_support_screen.additional_tips_title") ??
                  "",
              size: CustomTextSize.lg,
              fontWeight: FontWeight.w600,
              color: CustomTextColor.primary,
            ),
            AppSpacing.vsm,
            CustomText(
              text: helper?.tr("help_n_support_screen.additional_tips") ?? "",
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
