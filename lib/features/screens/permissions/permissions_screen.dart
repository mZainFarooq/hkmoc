import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/app_colors.dart';
import 'package:flutter_app/core/constants/app_spacing.dart';
import 'package:flutter_app/features/widgets/custom_text.dart';
import 'package:flutter_app/l10n/app_localizations.dart';
import 'package:flutter_app/layout/main_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  /// 🔧 Helper method to get localized label
  String getPermissionLabel(String key, AppLocalizations loc) {
    switch (key) {
      case 'notifications':
        return loc.appPermissionsScreenNotifications;
      case 'camera':
        return loc.appPermissionsScreenCamera;
      case 'location':
        return loc.appPermissionsScreenLocation;
      case 'microphone':
        return loc.appPermissionsScreenMicrophone;
      case 'contacts':
        return loc.appPermissionsScreenContacts;
      case 'storage':
        return loc.appPermissionsScreenStorage;
      default:
        return key;
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return MainLayout(
      title: loc.appPermissionsScreenTitle,
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
                        text: getPermissionLabel(key, loc), // ✅ Correct label
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
