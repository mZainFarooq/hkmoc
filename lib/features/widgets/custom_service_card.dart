import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app/core/constants/app_colors.dart';
import 'package:flutter_app/core/constants/app_spacing.dart';
import 'package:flutter_app/features/widgets/custom_text.dart';

class CustomServiceCard extends StatefulWidget {
  final IconData iconData;
  final String title;

  const CustomServiceCard({
    super.key,
    required this.iconData,
    required this.title,
  });

  @override
  State<CustomServiceCard> createState() => _CustomServiceCardState();
}

class _CustomServiceCardState extends State<CustomServiceCard> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final cardColor = isDark ? AppColors.darkSurface : AppColors.lightSurface;
    final iconColor = isDark ? AppColors.darkPrimary : AppColors.lightPrimary;

    return Card(
      color: cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      elevation: 2,
      child: Container(
        height: 80.h,
        padding: EdgeInsets.all(AppSpacing.md.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(widget.iconData, color: iconColor, size: 28.sp),
            AppSpacing.vsm,
            CustomText(
              maxLines: 1,
              text: widget.title,
              size: CustomTextSize.lg,
              fontWeight: FontWeight.bold,
              color: CustomTextColor.text,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
