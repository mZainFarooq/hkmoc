import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/app_assets.dart';
import 'package:flutter_app/core/constants/app_spacing.dart';
import 'package:flutter_app/features/widgets/custom_text.dart';
import 'package:flutter_app/provider/language_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

Widget buildWaveCard(context) {
  final languageProvider = Provider.of<LanguageProvider>(context);
  final helper = languageProvider.helper;

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
              Row(
                children: [
                  const CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage(avatarImage),
                  ),
                  AppSpacing.hsm,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text:
                            "${helper?.tr('dashboard_screen.greeting') ?? ''}, Muhammad Zain",
                        size: CustomTextSize.lg,
                        fontWeight: FontWeight.w600,
                        color: CustomTextColor.alwaysWhite,
                      ),
                      // AppSpacing.vxs,
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
            ],
          ),
        ),
      ],
    ),
  );
}

// 👇 Same WaveClipper
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
