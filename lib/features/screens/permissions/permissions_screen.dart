import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/app_colors.dart';
import 'package:flutter_app/core/constants/app_spacing.dart';
import 'package:flutter_app/features/widgets/custom_text.dart';
import 'package:flutter_app/layout/main_layout.dart';
import 'package:flutter_app/provider/language_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class PermissionsPage extends StatefulWidget {
  const PermissionsPage({super.key});

  @override
  State<PermissionsPage> createState() => _PermissionsPageState();
}

class _PermissionsPageState extends State<PermissionsPage> {
  final Map<String, bool> _permissions = {
    "notifications": false,
    "camera": false,
    "location": false,
    "microphone": false,
    "contacts": false,
    "storage": false,
  };

  @override
  Widget build(BuildContext context) {
    final helper = Provider.of<LanguageProvider>(context).helper;

    return MainLayout(
      title: helper?.tr("app_permissions_screen.title") ?? '',
      isBackAction: true,
      currentIndex: 0,
      showBottomNav: false,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.md.w,
          vertical: AppSpacing.md.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
              _permissions.keys.map((key) {
                bool value = _permissions[key]!;
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSpacing.xs.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: helper?.tr("app_permissions_screen.$key") ?? key,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: CustomTextColor.text,
                      ),
                      Switch(
                        value: value,
                        activeColor: AppColors.darkPrimary,
                        inactiveThumbColor: AppColors.lightTextSecondary,
                        inactiveTrackColor: AppColors.lightTextSecondary
                            .withValues(alpha: 0.3),
                        onChanged: (val) {
                          setState(() {
                            _permissions[key] = val;
                          });
                        },
                      ),
                    ],
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}
