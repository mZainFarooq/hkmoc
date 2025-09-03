import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../widgets/custom_text.dart';

class CustomAppCard extends StatelessWidget {
  final String id;
  final String service;
  final String date;
  final String details;
  final VoidCallback onTap;

  const CustomAppCard({
    super.key,
    required this.id,
    required this.service,
    required this.date,
    required this.details,
    required this.onTap,
  });

  static const services = [
    {"icon": Icons.ac_unit, "title": "AC Repair"},
    {"icon": Icons.handyman, "title": "Carpentry"},
    {"icon": Icons.plumbing, "title": "Plumbing"},
    {"icon": Icons.electrical_services, "title": "Electrical"},
    {"icon": Icons.cleaning_services, "title": "Cleaning"},
    {"icon": Icons.home_repair_service, "title": "Handyman"},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardColor = isDark ? AppColors.darkSurface : AppColors.lightSurface;

    final serviceIcon =
        services.firstWhere(
              (s) => s['title'] == service,
              orElse:
                  () => {
                    "icon": Icons.miscellaneous_services,
                    "title": service,
                  },
            )['icon']
            as IconData;

    return InkWell(
      onTap: onTap,
      child: Card(
        color: cardColor,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.sm.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(AppSpacing.md.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    serviceIcon,
                    size: 24.sp,
                    color:
                        isDark ? AppColors.lightPrimary : AppColors.darkPrimary,
                  ),
                  SizedBox(width: AppSpacing.sm.w),
                  Expanded(
                    child: CustomText(
                      text: service,
                      size: CustomTextSize.md,

                      fontWeight: FontWeight.w600,
                      color: CustomTextColor.text,
                    ),
                  ),
                  CustomText(
                    text: date,
                    size: CustomTextSize.sm,
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.normal,
                    color: CustomTextColor.textSecondary,
                  ),
                ],
              ),
              SizedBox(height: AppSpacing.xs.h),
              CustomText(
                text: details,
                size: CustomTextSize.md,
                fontWeight: FontWeight.normal,
                color: CustomTextColor.textSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
