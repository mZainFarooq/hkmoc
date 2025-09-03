import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/app_colors.dart';
import 'package:flutter_app/core/constants/app_spacing.dart';
import 'package:flutter_app/features/widgets/custom_text.dart';
import 'package:flutter_app/layout/main_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final privacyText = """
1. Introduction
We value your privacy and are committed to protecting your personal information. This Privacy Policy explains how we collect, use, and safeguard your data when you use our services.

2. Information Collection
We may collect information such as your name, email address, usage data, and device information to improve our services and provide personalized experiences.

3. Use of Information
Your data may be used to:
- Provide and improve our services
- Communicate with you
- Personalize your experience
- Comply with legal obligations

4. Data Sharing
We do not sell your personal information. However, we may share data with:
- Service providers
- Legal authorities if required by law
- Business partners for limited purposes

5. Security
We implement appropriate technical and organizational measures to protect your data from unauthorized access, loss, or misuse.

6. Cookies & Tracking
We use cookies and similar technologies to enhance user experience, analyze trends, and monitor site usage.

7. User Rights
You have the right to:
- Access and request a copy of your data
- Rectify inaccurate information
- Request deletion of your personal data
- Withdraw consent where applicable

8. Changes to Policy
We may update this Privacy Policy from time to time. Any changes will be communicated through the app or website.

9. Contact Us
If you have any questions or concerns regarding this Privacy Policy, please contact us at privacy@example.com.

Thank you for trusting our services!
""";

    return MainLayout(
      title: "Privacy Policy",
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
              text: "Privacy Policy",
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: CustomTextColor.primary,
            ),
            SizedBox(height: AppSpacing.lg.h),

            CustomText(
              text: privacyText,
              fontSize: 14.sp,
              color: CustomTextColor.text,
            ),

            SizedBox(height: AppSpacing.lg.h),

            // Optional: Accept Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
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
