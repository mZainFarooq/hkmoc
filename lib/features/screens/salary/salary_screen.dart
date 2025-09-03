import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/app_colors.dart';
import 'package:flutter_app/core/constants/app_spacing.dart';
import 'package:flutter_app/features/widgets/custom_text.dart';
import 'package:flutter_app/layout/main_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SalaryScreen extends StatelessWidget {
  const SalaryScreen({super.key});

  final List<Map<String, dynamic>> salaries = const [
    {
      "name": "Charlotte Elizabeth",
      "month": "July 2025",
      "totalDays": 31,
      "leaves": 0,
      "basicSalary": 60000,
      "deduction": 0,
      "netSalary": 60000,
      "deductionReason": "No deductions",
    },
    {
      "name": "Charlotte Elizabeth",
      "month": "June 2025",
      "totalDays": 30,
      "leaves": 2,
      "basicSalary": 50000,
      "deduction": 3000,
      "netSalary": 47000,
      "deductionReason": "2 unpaid leaves",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardColor = isDark ? AppColors.darkSurface : AppColors.lightSurface;
    final primaryColor =
        isDark ? AppColors.lightPrimary : AppColors.darkPrimary;

    return MainLayout(
      title: "Salary Details",
      isBackAction: true,
      currentIndex: 3,
      body: ListView.builder(
        padding: EdgeInsets.all(AppSpacing.md.w),
        itemCount: salaries.length,
        itemBuilder: (context, index) {
          final salary = salaries[index];
          return Container(
            margin: EdgeInsets.only(bottom: AppSpacing.md.h),
            padding: EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: isDark ? Colors.black26 : Colors.grey.shade300,
                  blurRadius: 6.r,
                  offset: Offset(0, 3.h),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "${salary["name"]} - ${salary["month"]}",
                  size: CustomTextSize.md,
                  fontWeight: FontWeight.bold,
                  color: CustomTextColor.primary,
                ),
                AppSpacing.vsm,
                Divider(color: Colors.grey.shade400),
                AppSpacing.vsm,
                _buildRow("Total Days", salary["totalDays"].toString()),
                _buildRow("Leaves Taken", salary["leaves"].toString()),
                _buildRow("Basic Salary", "₹${salary["basicSalary"]}"),
                _buildRow("Deductions", "₹${salary["deduction"]}"),
                _buildRow(
                  "Net Salary",
                  "₹${salary["netSalary"]}",
                  valueColor: primaryColor,
                  fontWeight: FontWeight.w600,
                ),
                _buildRow("Reason", salary["deductionReason"]),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildRow(
    String title,
    String value, {
    Color? valueColor,
    FontWeight fontWeight = FontWeight.w500,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: title,
            size: CustomTextSize.sm,
            fontWeight: FontWeight.w500,
            color: CustomTextColor.textSecondary,
          ),
          CustomText(
            text: value,
            size: CustomTextSize.sm,
            fontWeight: fontWeight,
            color: CustomTextColor.text,
          ),
        ],
      ),
    );
  }
}
