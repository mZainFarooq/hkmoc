import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/app_colors.dart';
import 'package:flutter_app/core/constants/app_spacing.dart';
import 'package:flutter_app/features/widgets/custom_text.dart';
import 'package:flutter_app/layout/main_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PermissionsPage extends StatefulWidget {
  const PermissionsPage({super.key});

  @override
  State<PermissionsPage> createState() => _PermissionsPageState();
}

class _PermissionsPageState extends State<PermissionsPage> {
  final Map<String, bool> _permissions = {
    "Notifications": false,
    "Camera": false,
    "Location": false,
    "Microphone": false,
    "Contacts": false,
    "Storage": false,
  };

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: "App Permissions",
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
                        text: key,
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
