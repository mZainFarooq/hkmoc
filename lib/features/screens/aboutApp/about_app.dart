import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/app_spacing.dart';
import 'package:flutter_app/features/widgets/custom_text.dart';
import 'package:flutter_app/layout/main_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      currentIndex: 4,
      title: "About App",
      isBackAction: true,
      showBottomNav: false,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSpacing.md.w),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Hotel Cleaning Service App",
              size: CustomTextSize.lg,
              fontWeight: FontWeight.bold,
              color: CustomTextColor.text,
            ),
            AppSpacing.vmd,
            CustomText(
              text:
                  "Welcome to our Hotel Cleaning Service App! This application is designed to streamline hotel operations and improve guest satisfaction. "
                  "Staff can efficiently manage cleaning schedules, laundry requests, and other services, "
                  "while guests can conveniently request services directly from their rooms or via their mobile devices.",
              size: CustomTextSize.sm,
              color: CustomTextColor.text,
            ),
            AppSpacing.vlg,
            CustomText(
              text: "Key Features:",
              size: CustomTextSize.lg,
              fontWeight: FontWeight.w600,
              color: CustomTextColor.primary,
            ),
            AppSpacing.vsm,
            _buildFeatureItem(
              "Room Cleaning Requests",
              "Guests can request room cleaning at their preferred time slots.",
            ),
            _buildFeatureItem(
              "Laundry Services",
              "Request laundry collection and delivery directly through the app.",
            ),
            _buildFeatureItem(
              "Staff Task Management",
              "Staff can manage and track assigned tasks efficiently.",
            ),
            _buildFeatureItem(
              "Notifications",
              "Receive timely notifications for service updates and schedules.",
            ),
            _buildFeatureItem(
              "Multi-Language Support",
              "Supports multiple languages for diverse users.",
            ),
            AppSpacing.vlg,
            CustomText(
              text: "Version 1.0.0",
              fontSize: 12.sp,
              color: CustomTextColor.primary,
            ),
            AppSpacing.vsm,
            CustomText(
              text:
                  "Developed with ❤️ to improve hotel management efficiency and guest experience.",
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
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: "• $title",
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
