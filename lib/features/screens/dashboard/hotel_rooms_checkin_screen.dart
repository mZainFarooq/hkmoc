import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/app_colors.dart';
import 'package:flutter_app/core/constants/app_spacing.dart';
import 'package:flutter_app/features/widgets/custom_button.dart';
import 'package:flutter_app/features/widgets/custom_text.dart';
import 'package:flutter_app/layout/main_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HotelRoomsWithCheckIn extends StatefulWidget {
  final String hotelId;
  final String hotelName;

  const HotelRoomsWithCheckIn({
    super.key,
    required this.hotelId,
    required this.hotelName,
  });

  @override
  State<HotelRoomsWithCheckIn> createState() => _HotelRoomsWithCheckInState();
}

class _HotelRoomsWithCheckInState extends State<HotelRoomsWithCheckIn> {
  Map<String, dynamic>? hotel;
  int seconds = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    loadHotelData();
    _startTimer();
  }

  Future<void> loadHotelData() async {
    final prefs = await SharedPreferences.getInstance();
    final String? hotelsString = prefs.getString('hotels');

    if (hotelsString != null) {
      final List<dynamic> hotels = json.decode(hotelsString);
      final selectedHotel = hotels.firstWhere(
        (h) => h['id'] == widget.hotelId,
        orElse: () => null,
      );

      if (selectedHotel != null) {
        setState(() {
          hotel = Map<String, dynamic>.from(selectedHotel);
        });
      }
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        seconds++;
      });
    });
  }

  String _formatTime(int totalSeconds) {
    final h = (totalSeconds ~/ 3600).toString().padLeft(2, '0');
    final m = ((totalSeconds % 3600) ~/ 60).toString().padLeft(2, '0');
    final s = (totalSeconds % 60).toString().padLeft(2, '0');
    return "$h:$m:$s";
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primary = isDark ? AppColors.darkPrimary : AppColors.lightPrimary;

    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        if (didPop) return;
        Navigator.pop(context, true);
      },
      child: MainLayout(
        title: widget.hotelName,
        showBottomNav: false,
        currentIndex: 0,
        isBackAction: true,
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppSpacing.md.h,
            horizontal: AppSpacing.md.w,
          ),
          child:
              hotel == null
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Timer
                      Center(
                        child: CustomText(
                          text: _formatTime(seconds),
                          size: CustomTextSize.xxl,
                          fontWeight: FontWeight.bold,
                          color: CustomTextColor.primary,
                        ),
                      ),
                      AppSpacing.vmd,

                      /// Heading
                      CustomText(
                        text: "Rooms to Clean",
                        size: CustomTextSize.xl,
                        fontWeight: FontWeight.bold,
                        color: CustomTextColor.text,
                      ),
                      AppSpacing.vmd,

                      /// Room List
                      Expanded(
                        child:
                            hotel == null
                                ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                                : Column(
                                  children: [
                                    /// Room List
                                    Expanded(
                                      child: ListView.builder(
                                        itemCount: hotel!["rooms"].length,
                                        itemBuilder: (context, index) {
                                          final room = hotel!["rooms"][index];

                                          return StatefulBuilder(
                                            builder: (context, setStateTile) {
                                              return Card(
                                                color:
                                                    isDark
                                                        ? AppColors.darkSurface
                                                        : AppColors
                                                            .lightSurface,
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                      vertical: 4,
                                                    ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child: ListTile(
                                                  leading: Icon(
                                                    Icons.meeting_room,
                                                    color: primary,
                                                  ),
                                                  title: CustomText(
                                                    text: room["roomName"],
                                                    size: CustomTextSize.md,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  trailing: InkWell(
                                                    onTap: () {
                                                      setStateTile(() {
                                                        room["isChecked"] =
                                                            !(room["isChecked"] ??
                                                                false);
                                                      });
                                                    },
                                                    child: Container(
                                                      width: 24.w,
                                                      height: 24.w,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                          color:
                                                              isDark
                                                                  ? AppColors
                                                                      .darkPrimary
                                                                  : AppColors
                                                                      .lightPrimary,
                                                          width: 2,
                                                        ),
                                                        color:
                                                            (room["isChecked"] ??
                                                                    false)
                                                                ? (isDark
                                                                    ? AppColors
                                                                        .darkPrimary
                                                                    : AppColors
                                                                        .lightPrimary)
                                                                : Colors
                                                                    .transparent,
                                                      ),
                                                      child:
                                                          (room["isChecked"] ??
                                                                  false)
                                                              ? const Icon(
                                                                Icons.check,
                                                                color:
                                                                    Colors
                                                                        .white,
                                                                size: 16,
                                                              )
                                                              : null,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),

                                    /// Bottom Row with Camera, Attach File & Submit
                                    SizedBox(height: 12.h),
                                    Row(
                                      children: [
                                        /// Camera Icon
                                        Container(
                                          padding: EdgeInsets.all(12.w),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:
                                                isDark
                                                    ? AppColors.darkPrimary
                                                    : AppColors.lightPrimary,
                                          ),
                                          child: const Icon(
                                            Icons.camera_alt,
                                            color: Colors.white,
                                            size: 24,
                                          ),
                                        ),

                                        SizedBox(
                                          width: 16.w,
                                        ), // gap between icons
                                        /// Attach File Icon
                                        Container(
                                          padding: EdgeInsets.all(12.w),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:
                                                isDark
                                                    ? AppColors.darkPrimary
                                                    : AppColors.lightPrimary,
                                          ),
                                          child: const Icon(
                                            Icons.attach_file,
                                            color: Colors.white,
                                            size: 24,
                                          ),
                                        ),

                                        SizedBox(width: 16.w),

                                        Expanded(
                                          child: CustomButton(
                                            text: "Submit",
                                            onPressed: () {},
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 12.h),
                                  ],
                                ),
                      ),
                    ],
                  ),
        ),
      ),
    );
  }
}
