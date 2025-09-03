import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/app_assets.dart';
import 'package:flutter_app/core/constants/app_colors.dart';
import 'package:flutter_app/core/constants/app_spacing.dart';
import 'package:flutter_app/features/widgets/custom_text.dart';
import 'package:flutter_app/layout/main_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  Widget _buildTextField({
    required String label,
    required String hint,
    bool isMultiline = false,
    bool isDark = false,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppSpacing.md.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: "$label *",
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: CustomTextColor.primary,
          ),
          SizedBox(height: 6.h),
          TextField(
            maxLines: isMultiline ? 3 : 1,
            style: TextStyle(
              fontSize: 14.sp,
              color: isDark ? AppColors.darkText : AppColors.lightText,
            ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                fontSize: 14.sp,
                color:
                    isDark
                        ? AppColors.darkTextSecondary
                        : AppColors.lightTextSecondary,
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: isMultiline ? 12.h : 10.h,
                horizontal: 12.w,
              ),
              filled: true,
              fillColor:
                  isDark ? AppColors.darkBackground : AppColors.lightBackground,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(
                  color:
                      isDark
                          ? Colors.white24
                          : Colors.black.withValues(alpha: 0.2),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(
                  color:
                      isDark ? AppColors.lightPrimary : AppColors.darkPrimary,
                  width: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return MainLayout(
      title: "Edit Profile",
      isBackAction: true,
      currentIndex: 3,
      showBottomNav: false,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSpacing.md.w),
        child: Column(
          children: [
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 45.r,
                    backgroundImage: AssetImage(avatarImage),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 4,
                    child: CircleAvatar(
                      radius: 16.r,
                      backgroundColor:
                          isDark
                              ? AppColors.lightPrimary
                              : AppColors.darkPrimary,
                      child: const Icon(
                        Icons.edit,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSpacing.lg.h),

            _buildTextField(
              label: "First Name",
              hint: "Junaid",
              isDark: isDark,
            ),
            _buildTextField(label: "Last Name", hint: "Ahmad", isDark: isDark),
            _buildTextField(
              label: "Email",
              hint: "ahmadjunaid791@gmail.com",
              isDark: isDark,
            ),
            _buildTextField(
              label: "Phone Number",
              hint: "+92 3023434506",
              isDark: isDark,
            ),
            _buildTextField(
              label: "Address",
              hint: "5 Maple Avenue, Richmond, London, TW10 6JR, UK",
              isMultiline: true,
              isDark: isDark,
            ),

            AppSpacing.hlg,

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      isDark ? AppColors.lightPrimary : AppColors.darkPrimary,
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                onPressed: () {},
                child: CustomText(
                  text: "Save",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: CustomTextColor.alwaysWhite,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
