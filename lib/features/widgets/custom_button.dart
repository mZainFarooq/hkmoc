import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app/features/widgets/custom_text.dart';
import '../../core/constants/app_colors.dart';

enum ButtonVariant { primary, outline }

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonVariant variant;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final bool isLoading;
  final bool isDisabled; // new key

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.variant = ButtonVariant.primary,
    this.borderRadius = 8.0,
    this.padding,
    this.isLoading = false,
    this.isDisabled = false, // default false
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final Color primaryBg =
        widget.isDisabled
            ? Colors.grey.shade400
            : (isDark ? AppColors.darkPrimary : AppColors.lightPrimary);

    final Color outlineBorder =
        widget.isDisabled
            ? Colors.grey.shade400
            : (isDark
                ? AppColors.darkTextSecondary
                : AppColors.lightTextSecondary);

    final Color textColorPrimary =
        widget.isDisabled ? Colors.grey.shade200 : AppColors.lightSurface;

    final Color textColorOutline =
        widget.isDisabled
            ? Colors.grey.shade200
            : (isDark ? AppColors.darkText : AppColors.lightText);

    final EdgeInsetsGeometry buttonPadding =
        widget.padding ??
        EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w);

    ButtonStyle style;

    if (widget.variant == ButtonVariant.primary) {
      style = ElevatedButton.styleFrom(
        backgroundColor: primaryBg,
        padding: buttonPadding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius.r),
        ),
      );
    } else {
      style = OutlinedButton.styleFrom(
        side: BorderSide(color: outlineBorder, width: 1.5.w),
        padding: buttonPadding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius.r),
        ),
      );
    }

    Widget childContent =
        widget.isLoading
            ? SizedBox(
              width: 20.w,
              height: 20.h,
              child: CircularProgressIndicator(
                strokeWidth: 2.w,
                valueColor: AlwaysStoppedAnimation<Color>(
                  widget.variant == ButtonVariant.primary
                      ? textColorPrimary
                      : textColorOutline,
                ),
              ),
            )
            : CustomText(
              text: widget.text,
              size: CustomTextSize.sm,
              fontWeight: FontWeight.w700,
              textAlign: TextAlign.center,
              color:
                  widget.variant == ButtonVariant.primary
                      ? CustomTextColor.alwaysWhite
                      : CustomTextColor.textSecondary,
            );

    return widget.variant == ButtonVariant.primary
        ? ElevatedButton(
          style: style,
          onPressed:
              (widget.isLoading || widget.isDisabled) ? null : widget.onPressed,
          child: childContent,
        )
        : OutlinedButton(
          style: style,
          onPressed:
              (widget.isLoading || widget.isDisabled) ? null : widget.onPressed,
          child: childContent,
        );
  }
}
