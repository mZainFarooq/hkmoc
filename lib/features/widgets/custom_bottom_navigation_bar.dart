import 'package:flutter/material.dart';
import 'package:flutter_app/features/widgets/custom_text.dart';
import 'package:flutter_app/l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app/core/constants/app_spacing.dart';
import '../../core/constants/app_colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final activeColor = isDark ? AppColors.darkPrimary : AppColors.lightPrimary;
    final inactiveColor =
        isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;
    final local = AppLocalizations.of(context)!;
    final items = [
      {
        'icon': Icons.dashboard,
        'label': local.bottomNavigatorDashboard,
        'route': '/dashboard',
      },
      {
        'icon': Icons.history,
        'label': local.bottomNavigatorHistory,
        'route': '/history',
      },
      {
        'icon': Icons.settings,
        'label': local.bottomNavigatorSetting,
        'route': '/settings',
      },
    ];

    return SizedBox(
      height: 60.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final color = currentIndex == index ? activeColor : inactiveColor;
          return GestureDetector(
            onTap: () => onTap(index),
            behavior: HitTestBehavior.opaque,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  items[index]['icon'] as IconData,
                  color: color,
                  size: 24.sp,
                ),
                AppSpacing.hxs,
                CustomText(
                  text: items[index]['label'] as String,
                  color:
                      currentIndex == index
                          ? CustomTextColor.primary
                          : CustomTextColor.textSecondary,
                  size: CustomTextSize.xs,
                  fontWeight:
                      currentIndex == index
                          ? FontWeight.w600
                          : FontWeight.normal,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
