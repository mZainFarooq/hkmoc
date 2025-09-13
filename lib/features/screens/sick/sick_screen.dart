import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/app_colors.dart';
import 'package:flutter_app/core/constants/app_spacing.dart';
import 'package:flutter_app/features/widgets/custom_text.dart';
import 'package:flutter_app/features/widgets/custom_button.dart';
import 'package:flutter_app/l10n/app_localizations.dart';
import 'package:flutter_app/layout/main_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SickLeavePage extends StatefulWidget {
  const SickLeavePage({super.key});

  @override
  State<SickLeavePage> createState() => _SickLeavePageState();
}

class _SickLeavePageState extends State<SickLeavePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  DateTime? fromDate;
  DateTime? toDate;
  bool todayOnly = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  Future<void> _pickDate(BuildContext context, bool isFrom) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        if (isFrom) {
          fromDate = picked;
        } else {
          toDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final loc = AppLocalizations.of(context)!;

    return MainLayout(
      title: loc.leaveScreenScreenTitle,
      isBackAction: true,
      currentIndex: 3,
      showBottomNav: false,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: AppSpacing.md.w,
              vertical: AppSpacing.sm.h,
            ),
            child: TabBar(
              controller: _tabController,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  color:
                      isDark ? AppColors.lightPrimary : AppColors.darkPrimary,
                  width: 2,
                ),
              ),
              indicatorSize: TabBarIndicatorSize.label,
              labelColor:
                  isDark ? AppColors.lightPrimary : AppColors.darkPrimary,
              unselectedLabelColor: Colors.grey,
              labelPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 6,
              ),
              tabs: [
                Tab(
                  child: CustomText(
                    text: loc.leaveScreenTabsApply,
                    color: CustomTextColor.primary,
                    size: CustomTextSize.md,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Tab(
                  child: CustomText(
                    text: loc.leaveScreenTabsHistory,
                    color: CustomTextColor.primary,
                    size: CustomTextSize.md,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: const BouncingScrollPhysics(),
              children: [
                _buildFormUI(context, isDark),
                _buildHistoryList(context, isDark),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormUI(BuildContext context, bool isDark) {
    final loc = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.lg.w,
        vertical: AppSpacing.md.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: loc.leaveScreenFormApplyTitle,
            size: CustomTextSize.md,
            fontWeight: FontWeight.w600,
            color: CustomTextColor.primary,
          ),
          AppSpacing.vlg,

          // Title Field
          _styledField(hint: loc.leaveScreenFormTitle, isDark: isDark),
          AppSpacing.vmd,

          // Dates Row
          if (!todayOnly)
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => _pickDate(context, true),
                    child: _dateBox(
                      loc.leaveScreenFormFromDate,
                      fromDate,
                      isDark,
                    ),
                  ),
                ),
                AppSpacing.hmd,
                Expanded(
                  child: GestureDetector(
                    onTap: () => _pickDate(context, false),
                    child: _dateBox(loc.leaveScreenFormToDate, toDate, isDark),
                  ),
                ),
              ],
            ),
          if (!todayOnly) AppSpacing.vmd,

          // Details TextArea
          _styledField(
            hint: loc.leaveScreenFormDetails,
            isDark: isDark,
            maxLines: 4,
          ),
          AppSpacing.vlg,

          // Submit Button
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              text: loc.leaveScreenFormSubmit,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _styledField({
    required String hint,
    required bool isDark,
    int maxLines = 1,
  }) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor:
            isDark ? AppColors.darkBackground : AppColors.lightBackground,
        contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color:
                isDark
                    ? AppColors.darkTextSecondary
                    : AppColors.lightTextSecondary,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: isDark ? AppColors.lightPrimary : AppColors.darkPrimary,
            width: 1.5,
          ),
        ),
      ),
    );
  }

  Widget _dateBox(String label, DateTime? date, bool isDark) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkBackground : AppColors.lightBackground,
        border: Border.all(
          color:
              isDark
                  ? AppColors.darkTextSecondary
                  : AppColors.lightTextSecondary,
        ),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: CustomText(
        text: date != null ? "${date.day}/${date.month}/${date.year}" : label,
        fontSize: 14.sp,
        color:
            date != null
                ? CustomTextColor.primary
                : CustomTextColor.textSecondary,
      ),
    );
  }

  Widget _buildHistoryList(BuildContext context, bool isDark) {
    final loc = AppLocalizations.of(context)!;

    final dummyLeaves = [
      {
        "title": "Bukhar",
        "date": "25 Aug 2025 - 26 Aug 2025",
        "detail": "Severe fever, doctor advised rest for one day.",
        "status": loc.leaveScreenHistoryStatusApproved,
      },
      {
        "title": "Family Work",
        "date": "20 Aug 2025",
        "detail": "Needed to attend urgent family work.",
        "status": loc.leaveScreenHistoryStatusCancelled,
      },
    ];

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.md.w,
        vertical: AppSpacing.sm.h,
      ),
      itemCount: dummyLeaves.length,
      itemBuilder: (context, index) {
        final leave = dummyLeaves[index];
        return Container(
          margin: EdgeInsets.only(bottom: AppSpacing.md.h),
          padding: EdgeInsets.all(AppSpacing.lg.w),
          decoration: BoxDecoration(
            color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: leave["title"]!,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: CustomTextColor.primary,
              ),
              SizedBox(height: 6.h),
              CustomText(
                text: leave["date"]!,
                fontSize: 14.sp,
                color: CustomTextColor.textSecondary,
              ),
              SizedBox(height: AppSpacing.sm.h),
              CustomText(
                text: leave["detail"]!,
                fontSize: 14.sp,
                color: CustomTextColor.text,
              ),
              SizedBox(height: AppSpacing.md.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color:
                          leave["status"] ==
                                  loc.leaveScreenHistoryStatusApproved
                              ? Colors.green.withValues(alpha: 0.15)
                              : Colors.red.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      leave["status"]!,
                      style: TextStyle(
                        color:
                            leave["status"] ==
                                    loc.leaveScreenHistoryStatusApproved
                                ? Colors.green
                                : Colors.red,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
