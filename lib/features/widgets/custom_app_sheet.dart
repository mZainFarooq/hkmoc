import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_button.dart';

class CustomAppSheet extends StatelessWidget {
  final String title;
  final Map<String, String> data;
  final bool isDisabled;
  final VoidCallback? onButtonPressed;
  final String buttonLabel;

  const CustomAppSheet({
    super.key,
    required this.title,
    required this.data,
    this.isDisabled = false,
    this.onButtonPressed,
    required this.buttonLabel,
  });

  Widget _buildRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 90,
            child: CustomText(
              text: "$label:",
              size: CustomTextSize.sm,
              fontWeight: FontWeight.bold,
              color: CustomTextColor.text,
            ),
          ),
          Expanded(
            child: CustomText(
              text: value,
              size: CustomTextSize.sm,
              fontWeight: FontWeight.normal,
              color: CustomTextColor.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: title,
                    size: CustomTextSize.lg,
                    fontWeight: FontWeight.bold,
                    color: CustomTextColor.text,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.close,
                      color: isDark ? AppColors.lightText : AppColors.darkText,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              SizedBox(height: AppSpacing.md),
              _buildRow(context, "ID", data['id'] ?? ""),
              _buildRow(context, "Service", data['service'] ?? ""),
              _buildRow(context, "Date", data['date'] ?? ""),
              _buildRow(context, "Details", data['details'] ?? ""),
              SizedBox(height: AppSpacing.md),
              if (isDisabled)
                Center(
                  child: CustomText(
                    text: "15 days limit crossed",
                    color: CustomTextColor.error,
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.normal,
                  ),
                ),
              if (!isDisabled) ...[
                SizedBox(height: AppSpacing.md),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    text: buttonLabel,
                    onPressed: onButtonPressed ?? () {},
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
