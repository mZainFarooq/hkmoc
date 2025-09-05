import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/app_colors.dart';
import 'package:flutter_app/core/constants/app_spacing.dart';
import 'package:flutter_app/core/utils/custom_navigation.dart';
import 'package:flutter_app/features/screens/aboutApp/about_app.dart';
import 'package:flutter_app/features/screens/helpnsupport/help_and_support.dart';
import 'package:flutter_app/features/screens/notfications/notifcations_screen.dart';
import 'package:flutter_app/features/screens/profile/edit_profile.dart';
import 'package:flutter_app/features/screens/sick/sick_screen.dart';
import 'package:flutter_app/features/widgets/custom_text.dart';
import 'package:flutter_app/layout/main_layout.dart';
import 'package:flutter_app/provider/language_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(top: AppSpacing.lg.h, bottom: AppSpacing.sm.h),
      child: CustomText(
        text: title,
        size: CustomTextSize.md,
        fontWeight: FontWeight.bold,
        color: CustomTextColor.text,
      ),
    );
  }

  Widget _buildTile({
    required BuildContext context,
    required IconData icon,
    required String title,
    VoidCallback? onTap,
    Color? iconColor,
    bool showArrow = true,
    Widget? trailing,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Card(
      margin: EdgeInsets.symmetric(vertical: AppSpacing.xs.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      elevation: 0,
      color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
      child: ListTile(
        leading: Icon(
          icon,
          color:
              iconColor ??
              (isDark ? AppColors.darkPrimary : AppColors.lightPrimary),
          size: 20,
        ),
        title: CustomText(
          text: title,
          size: CustomTextSize.sm,
          fontWeight: FontWeight.w500,
        ),
        trailing:
            trailing ??
            (showArrow ? const Icon(Icons.arrow_forward_ios, size: 12) : null),
        onTap: onTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final helper = languageProvider.helper;
    return MainLayout(
      title: helper?.tr('setting_screen.screen_title') ?? '',
      currentIndex: 2,
      isSidebarEnabled: true,
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppSpacing.md.h,
          horizontal: AppSpacing.md.w,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Account Section
              _buildSectionTitle(
                helper?.tr('setting_screen.account_section') ?? '',
              ),
              _buildTile(
                context: context,
                icon: Icons.person_outline,
                title: helper?.tr('setting_screen.edit_profile') ?? '',
                onTap:
                    () => CustomNavigation.push(context, EditProfileScreen()),
              ),
              _buildTile(
                context: context,
                icon: Icons.notifications_outlined,
                title: helper?.tr('setting_screen.notifications') ?? '',
                onTap:
                    () => CustomNavigation.push(
                      context,
                      const NotificationsScreen(),
                    ),
              ),
              _buildTile(
                context: context,
                icon: Icons.sick_outlined,
                title: helper?.tr('setting_screen.sick_leave') ?? '',
                onTap: () {
                  CustomNavigation.push(context, SickLeavePage());
                },
              ),

              _buildSectionTitle(
                helper?.tr('setting_screen.preferences_section') ?? '',
              ),
              _buildTile(
                context: context,
                icon: Icons.help_outline,
                title: helper?.tr('setting_screen.help_support') ?? '',
                onTap: () {
                  CustomNavigation.push(context, HelpAndSupportScreen());
                },
              ),
              _buildTile(
                context: context,
                icon: Icons.info_outline,
                title: helper?.tr('setting_screen.about_app') ?? '',
                onTap: () {
                  CustomNavigation.push(context, AboutAppScreen());
                },
              ),

              AppSpacing.hlg,
            ],
          ),
        ),
      ),
    );
  }
}
