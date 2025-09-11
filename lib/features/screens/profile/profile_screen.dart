import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/app_assets.dart';
import 'package:flutter_app/core/utils/custom_navigation.dart';
import 'package:flutter_app/features/screens/auth/login_screen.dart';
import 'package:flutter_app/provider/language_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app/core/constants/app_colors.dart';
import 'package:flutter_app/core/constants/app_spacing.dart';
import 'package:flutter_app/features/widgets/custom_button.dart';
import 'package:flutter_app/features/widgets/custom_text.dart';
import 'package:provider/provider.dart';
import '../../../layout/main_layout.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final String avatarUrl = 'https://i.pravatar.cc/300';
  final String fullName = 'Charlotte Elizabeth';
  final String phoneNumber = '+92 300 1234567';
  final String address = 'Lahore, Pakistan';
  final String createdAt = '2024-01-10';

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final helper = languageProvider.helper;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardColor = isDark ? AppColors.darkSurface : AppColors.lightSurface;
    final primaryColor =
        isDark ? AppColors.darkPrimary : AppColors.lightPrimary;

    return MainLayout(
      title: helper?.tr('profile_screen.screen_title') ?? '',
      currentIndex: 2,
      showBottomNav: false,
      isBackAction: true,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.md.h,
          vertical: AppSpacing.md.w,
        ),
        child: Column(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 60.r,
                  backgroundImage: AssetImage(avatarImage),
                ),
                Positioned(
                  bottom: 0,
                  right: 4.w,
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(30.r),
                    child: Container(
                      padding: EdgeInsets.all(6.w),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 4.r),
                        ],
                      ),
                      child: Icon(
                        Icons.edit,
                        color:
                            isDark
                                ? AppColors.darkBackground
                                : AppColors.lightBackground,
                        size: 20.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            AppSpacing.vlg,
            CustomText(
              text: fullName,
              size: CustomTextSize.xl,
              fontWeight: FontWeight.bold,

              color: CustomTextColor.text,
            ),
            AppSpacing.vmd,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildInfoChip(
                  Icons.calendar_today,
                  '${helper?.tr('profile_screen.joined_date_prefix') ?? ''} $createdAt',
                  primaryColor,
                  CustomTextColor.textSecondary,
                ),
              ],
            ),
            AppSpacing.vlg,
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 24.w),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                    color: isDark ? Colors.black54 : Colors.grey.shade200,
                    blurRadius: 6.r,
                    offset: Offset(0, 2.h),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildDetailRow(
                    Icons.phone,
                    phoneNumber,
                    CustomTextColor.textSecondary,
                  ),
                  Divider(height: 32.h, color: Colors.grey),
                  _buildDetailRow(
                    Icons.person_outline,
                    helper?.tr('profile_screen.role_label') ?? '',
                    CustomTextColor.textSecondary,
                  ),
                  Divider(height: 32.h, color: Colors.grey),
                  _buildDetailRow(
                    Icons.location_on_outlined,
                    address,
                    CustomTextColor.textSecondary,
                  ),
                ],
              ),
            ),
            AppSpacing.vlg,
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                text: helper?.tr('profile_screen.logout_button') ?? '',
                onPressed: () {
                  CustomNavigation.push(context, LoginScreen());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(
    IconData icon,
    String value,
    CustomTextColor valueColor,
  ) {
    return Row(
      children: [
        Icon(icon, size: 24.sp, color: Colors.grey),
        AppSpacing.hsm,
        Expanded(
          child: CustomText(
            text: value,
            size: CustomTextSize.md,
            fontWeight: FontWeight.normal,
            color: valueColor,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoChip(
    IconData icon,
    String label,
    Color bgColor,
    CustomTextColor textColor,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: bgColor.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18.sp, color: bgColor),
          AppSpacing.hsm,
          CustomText(
            text: label,
            size: CustomTextSize.sm,
            fontWeight: FontWeight.w600,
            color: CustomTextColor.text,
          ),
        ],
      ),
    );
  }
}
