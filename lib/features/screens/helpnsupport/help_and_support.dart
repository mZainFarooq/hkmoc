import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/app_spacing.dart';
import 'package:flutter_app/features/widgets/custom_text.dart';
import 'package:flutter_app/layout/main_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelpAndSupportScreen extends StatelessWidget {
  const HelpAndSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: "Help & Support",
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
              text: "Need Help?",
              size: CustomTextSize.xl,
              fontWeight: FontWeight.bold,
              color: CustomTextColor.text,
            ),
            AppSpacing.vmd,
            CustomText(
              text:
                  "If you are facing any issues with the app, please contact our support team. "
                  "We are here to help you 24/7 and ensure your experience is smooth and hassle-free.",
              size: CustomTextSize.sm,
              color: CustomTextColor.text,
            ),
            SizedBox(height: 24.h),

            CustomText(
              text: "Common Issues",
              size: CustomTextSize.lg,
              fontWeight: FontWeight.w600,
              color: CustomTextColor.primary,
            ),
            SizedBox(height: 12.h),

            _buildIssueItem(
              "Login Problems",
              "If you are unable to login, ensure your credentials are correct and your internet connection is stable.",
            ),
            _buildIssueItem(
              "Payment Issues",
              "For payment errors, check your payment method details or contact your bank.",
            ),
            _buildIssueItem(
              "Booking Errors",
              "If your booking is not showing correctly, try refreshing the app or contact support.",
            ),
            _buildIssueItem(
              "App Crashes",
              "Restart the app. If the issue persists, clear the cache or reinstall the app.",
            ),
            _buildIssueItem(
              "Notifications Not Working",
              "Ensure notifications are enabled in your phone settings and app permissions.",
            ),

            SizedBox(height: 24.h),
            CustomText(
              text: "Contact Us",
              size: CustomTextSize.lg,
              fontWeight: FontWeight.w600,
              color: CustomTextColor.primary,
            ),
            SizedBox(height: 12.h),
            CustomText(
              text:
                  "You can reach out to our support team anytime via email, phone, or live chat. We are committed to resolving your issues promptly.",
              size: CustomTextSize.sm,
              color: CustomTextColor.text,
            ),
            SizedBox(height: 12.h),
            CustomText(
              text: "📧 Email: support@hotelapp.com",
              size: CustomTextSize.sm,
              color: CustomTextColor.primary,
            ),
            SizedBox(height: 8.h),
            CustomText(
              text: "📞 Phone: +92 300 1234567",
              size: CustomTextSize.sm,
              color: CustomTextColor.primary,
            ),
            SizedBox(height: 8.h),
            CustomText(
              text: "💬 Live Chat: Available 24/7 in the app",
              size: CustomTextSize.sm,
              color: CustomTextColor.primary,
            ),

            SizedBox(height: 24.h),
            CustomText(
              text: "Additional Tips",
              size: CustomTextSize.lg,
              fontWeight: FontWeight.w600,
              color: CustomTextColor.primary,
            ),
            SizedBox(height: 12.h),
            CustomText(
              text:
                  "• Always keep your app updated to the latest version.\n"
                  "• Clear cache regularly to avoid app slowdowns.\n"
                  "• Make sure you have a stable internet connection.\n"
                  "• Report any bugs or issues immediately so we can fix them.",
              size: CustomTextSize.sm,
              color: CustomTextColor.text,
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  Widget _buildIssueItem(String title, String description) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: title,
            size: CustomTextSize.md,
            fontWeight: FontWeight.w600,
            color: CustomTextColor.text,
          ),
          SizedBox(height: 4.h),
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
