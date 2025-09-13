import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/app_spacing.dart';
import 'package:flutter_app/features/widgets/custom_text.dart';
import 'package:flutter_app/l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

Widget buildWaveCard(context) {
  final loc = AppLocalizations.of(context)!;

  String getFormattedDate() {
    return DateFormat('EEEE, MMM d, yyyy').format(DateTime.now());
  }

  return Container(
    width: double.infinity,
    height: 180.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12.r),
      gradient: const LinearGradient(
        colors: [
          Color.fromARGB(255, 235, 90, 0),
          Color(0xFFFD7F2C),
          Color(0xFFFD9346),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    child: Stack(
      children: [
        ClipPath(
          clipper: WaveClipper(),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              gradient: LinearGradient(
                colors: [
                  Colors.white.withValues(alpha: 0.3),
                  Colors.white.withValues(alpha: 0.05),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppSpacing.md.w,
            horizontal: AppSpacing.md.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Greeting & Date
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "${loc.dashboardScreenGreeting}, Muhammad Zain",
                        size: CustomTextSize.lg,
                        fontWeight: FontWeight.w600,
                        color: CustomTextColor.alwaysWhite,
                      ),
                      CustomText(
                        text: getFormattedDate(),
                        size: CustomTextSize.sm,
                        fontWeight: FontWeight.normal,
                        color: CustomTextColor.alwaysWhite,
                      ),
                    ],
                  ),
                ],
              ),
              AppSpacing.vsm,

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildInfoPoint(loc.greetCardHotelsAssigned, "3"),
                  _buildInfoPoint(loc.greetCardPendingHotels, "3"),
                  _buildInfoPoint(loc.greetCardCompleteHotels, "0"),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

/// ✅ Info Point Widget
Widget _buildInfoPoint(String title, String number) {
  return Flexible(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Number text responsive
        FittedBox(
          child: CustomText(
            text: number,
            size: CustomTextSize.lg,
            fontWeight: FontWeight.bold,
            color: CustomTextColor.alwaysWhite,
          ),
        ),
        AppSpacing.vxs,

        // Middle line responsive
        Container(
          width: 4.w.clamp(2.w, 6.w), // limit width min/max
          height: 30.h.clamp(20.h, 40.h),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFFFFFFF), Color(0xFFFD9346)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(2.r),
          ),
        ),
        AppSpacing.vxs,

        SizedBox(
          width: 70.w, // fix width relative to screen
          child: CustomText(
            text: title,
            size: CustomTextSize.sm,
            fontWeight: FontWeight.w500,
            color: CustomTextColor.alwaysWhite,
            textAlign: TextAlign.center,
            maxLines: 2, // overflow handle
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
}

/// Same WaveClipper
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 30);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2, size.height - 30);
    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    var secondControlPoint = Offset(3 * size.width / 4, size.height - 90);
    var secondEndPoint = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondEndPoint.dx,
      secondEndPoint.dy,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
