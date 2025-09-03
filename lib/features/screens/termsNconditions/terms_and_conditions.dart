import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/app_colors.dart';
import 'package:flutter_app/core/constants/app_spacing.dart';
import 'package:flutter_app/features/widgets/custom_text.dart';
import 'package:flutter_app/layout/main_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: "Terms & Conditions",
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
            CustomText(
              text: "Terms & Conditions",
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: CustomTextColor.primary,
            ),
            SizedBox(height: AppSpacing.lg.h),

            CustomText(
              text:
                  "Welcome to our app! Please read these Terms and Conditions carefully before using our services. By accessing or using our app, you agree to be bound by these terms. If you do not agree with any part of these terms, please do not use our app.",
              fontSize: 14.sp,
              color: CustomTextColor.text,
            ),
            SizedBox(height: AppSpacing.md.h),

            CustomText(
              text: "1. Use of Service",
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: CustomTextColor.primary,
            ),
            SizedBox(height: AppSpacing.sm.h),
            CustomText(
              text:
                  "You agree to use the app only for lawful purposes and in a way that does not infringe the rights of others. You must not use the app for any fraudulent or harmful activity, including but not limited to hacking, spamming, or distributing malicious content.",
              fontSize: 14.sp,
              color: CustomTextColor.text,
            ),
            SizedBox(height: AppSpacing.md.h),

            CustomText(
              text: "2. Account Responsibility",
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: CustomTextColor.primary,
            ),
            SizedBox(height: AppSpacing.sm.h),
            CustomText(
              text:
                  "You are responsible for maintaining the confidentiality of your account information and password. You agree to notify us immediately of any unauthorized use of your account or any other breach of security.",
              fontSize: 14.sp,
              color: CustomTextColor.text,
            ),
            SizedBox(height: AppSpacing.md.h),

            CustomText(
              text: "3. Privacy",
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: CustomTextColor.primary,
            ),
            SizedBox(height: AppSpacing.sm.h),
            CustomText(
              text:
                  "We respect your privacy. All personal information collected will be handled according to our privacy policy. By using the app, you consent to the collection, use, and sharing of your information as described in the privacy policy.",
              fontSize: 14.sp,
              color: CustomTextColor.text,
            ),
            SizedBox(height: AppSpacing.md.h),

            CustomText(
              text: "4. Intellectual Property",
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: CustomTextColor.primary,
            ),
            SizedBox(height: AppSpacing.sm.h),
            CustomText(
              text:
                  "All content, features, and functionality on the app are the intellectual property of the company and are protected by copyright, trademark, and other laws. You may not reproduce, distribute, or create derivative works without our express written permission.",
              fontSize: 14.sp,
              color: CustomTextColor.text,
            ),
            SizedBox(height: AppSpacing.md.h),

            CustomText(
              text: "5. Limitation of Liability",
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: CustomTextColor.primary,
            ),
            SizedBox(height: AppSpacing.sm.h),
            CustomText(
              text:
                  "We are not responsible for any damages, losses, or costs arising from the use or inability to use our app. The app is provided on an 'as-is' basis without warranties of any kind, either express or implied.",
              fontSize: 14.sp,
              color: CustomTextColor.text,
            ),
            SizedBox(height: AppSpacing.md.h),

            CustomText(
              text: "6. Termination",
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: CustomTextColor.primary,
            ),
            SizedBox(height: AppSpacing.sm.h),
            CustomText(
              text:
                  "We may suspend or terminate your access to the app at our sole discretion, without notice or liability, for conduct that violates these terms or is harmful to the app, other users, or third parties.",
              fontSize: 14.sp,
              color: CustomTextColor.text,
            ),
            SizedBox(height: AppSpacing.md.h),

            CustomText(
              text: "7. Changes to Terms",
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: CustomTextColor.primary,
            ),
            SizedBox(height: AppSpacing.sm.h),
            CustomText(
              text:
                  "We reserve the right to modify these terms at any time. Continued use of the app constitutes acceptance of the updated terms. We recommend reviewing the terms regularly to stay informed about any changes.",
              fontSize: 14.sp,
              color: CustomTextColor.text,
            ),
            SizedBox(height: AppSpacing.lg.h),

            // Accept Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // back to previous page
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.darkPrimary,
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: CustomText(
                  text: "Accept",
                  color: CustomTextColor.alwaysWhite,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
