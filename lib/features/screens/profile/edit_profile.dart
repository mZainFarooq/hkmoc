import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/app_assets.dart';
import 'package:flutter_app/core/constants/app_colors.dart';
import 'package:flutter_app/core/constants/app_fonts_sizes.dart';
import 'package:flutter_app/core/constants/app_spacing.dart';
import 'package:flutter_app/features/widgets/custom_text.dart';
import 'package:flutter_app/layout/main_layout.dart';
import 'package:flutter_app/provider/language_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

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
            size: CustomTextSize.sm,
            fontWeight: FontWeight.w500,
            color: CustomTextColor.primary,
          ),
          AppSpacing.vxs,
          TextField(
            maxLines: isMultiline ? 3 : 1,
            style: TextStyle(
              fontSize: AppFonts.sm,
              color: isDark ? AppColors.darkText : AppColors.lightText,
            ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                fontSize: AppFonts.sm,
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
    final languageProvider = Provider.of<LanguageProvider>(context);
    final helper = languageProvider.helper;
    return MainLayout(
      title: helper?.tr('edit_profile_screen.screen_title') ?? '',
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
              label: helper?.tr('edit_profile_screen.labels.first_name') ?? '',
              hint: helper?.tr('edit_profile_screen.hints.first_name') ?? '',
              isDark: isDark,
            ),
            _buildTextField(
              label: helper?.tr('edit_profile_screen.labels.last_name') ?? '',
              hint: helper?.tr('edit_profile_screen.hints.last_name') ?? '',
              isDark: isDark,
            ),
            _buildTextField(
              label: helper?.tr('edit_profile_screen.labels.email') ?? '',
              hint: helper?.tr('edit_profile_screen.hints.email') ?? '',
              isDark: isDark,
            ),
            _buildTextField(
              label:
                  helper?.tr('edit_profile_screen.labels.phone_number') ?? '',
              hint: helper?.tr('edit_profile_screen.hints.phone_number') ?? '',
              isDark: isDark,
            ),
            _buildTextField(
              label: helper?.tr('edit_profile_screen.labels.address') ?? '',
              hint: helper?.tr('edit_profile_screen.hints.address') ?? '',
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
                  text: helper?.tr('edit_profile_screen.button') ?? '',
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
