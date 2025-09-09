import 'package:flutter/material.dart';
import 'package:flutter_app/provider/language_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../../widgets/custom_text.dart';
import '../../../layout/main_layout.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final List<Map<String, String>> notifications = [
    {
      "title": "Room Cleaning Assigned",
      "message":
          "You have been assigned to clean Room 204. Please start within the next 15 minutes.",
      "time": "15 min ago",
      "icon": "cleaning_services",
    },
    {
      "title": "Bathroom Deep Cleaning",
      "message":
          "A deep cleaning request has been scheduled for Room 310. Use special cleaning supplies.",
      "time": "20 min ago",
      "icon": "soap",
    },
    {
      "title": "Laundry Pickup",
      "message":
          "Collect used linens and towels from Room 118 and deliver them to the laundry section.",
      "time": "1 hr ago",
      "icon": "local_laundry_service",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final helper = languageProvider.helper;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardColor = isDark ? AppColors.darkSurface : AppColors.lightSurface;
    return MainLayout(
      title: helper?.tr('notification_screen.screen_title') ?? '',
      currentIndex: 2,
      isBackAction: true,
      isNotficationIcon: false,
      showBottomNav: false,
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.md.h,
          vertical: AppSpacing.md.w,
        ),
        itemCount: notifications.length,
        separatorBuilder: (context, index) => SizedBox(height: AppSpacing.md.h),
        itemBuilder: (context, index) {
          final notif = notifications[index];
          return Container(
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(AppSpacing.md.r),
              border: Border.all(
                color:
                    isDark
                        ? AppColors.darkTextSecondary.withValues(alpha: 0.3)
                        : Colors.grey.shade300,
              ),
              boxShadow: [
                if (!isDark)
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 6.r,
                    offset: const Offset(0, 3),
                  ),
              ],
            ),
            padding: EdgeInsets.all(AppSpacing.md.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor:
                      isDark
                          ? AppColors.darkPrimary.withValues(alpha: 0.15)
                          : AppColors.lightPrimary.withValues(alpha: 0.15),
                  radius: 24.r,
                  child: Icon(
                    notif["icon"] is IconData
                        ? notif["icon"] as IconData
                        : Icons.notifications,
                    color:
                        isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
                    size: 24.sp,
                  ),
                ),
                SizedBox(width: AppSpacing.md.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: CustomText(
                              text: notif["title"] ?? "",
                              size: CustomTextSize.md,
                              fontWeight: FontWeight.bold,

                              color: CustomTextColor.text,
                            ),
                          ),
                          CustomText(
                            text: notif["time"] ?? "",
                            size: CustomTextSize.sm,
                            color: CustomTextColor.textSecondary,
                            fontWeight: FontWeight.normal,
                          ),
                        ],
                      ),
                      SizedBox(height: AppSpacing.xs.h),
                      CustomText(
                        text: notif["message"] ?? "",
                        size: CustomTextSize.md,
                        fontWeight: FontWeight.normal,
                        color: CustomTextColor.textSecondary,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
