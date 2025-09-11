import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/app_colors.dart';
import 'package:flutter_app/core/constants/app_spacing.dart';
import 'package:flutter_app/features/widgets/custom_text.dart';
import 'package:flutter_app/layout/main_layout.dart';
import 'package:flutter_app/provider/language_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class HotelRoomsScreen extends StatefulWidget {
  final String hotelId;
  final String hotelName;

  const HotelRoomsScreen({
    super.key,
    required this.hotelId,
    required this.hotelName,
  });

  @override
  State<HotelRoomsScreen> createState() => _HotelRoomsScreenState();
}

class _HotelRoomsScreenState extends State<HotelRoomsScreen> {
  Map<String, dynamic>? hotel;

  @override
  void initState() {
    super.initState();
    loadHotelData();
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

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primary = isDark ? AppColors.darkPrimary : AppColors.lightPrimary;
    final languageProvider = Provider.of<LanguageProvider>(context);
    final helper = languageProvider.helper;

    return MainLayout(
      title: widget.hotelName,
      hotelInfo: {"hotelId": widget.hotelId, "hotelName": widget.hotelName},
      currentIndex: 0,
      isBackAction: true,
      showBottomNav: false,
      isCheckIn: true,
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppSpacing.md.h,
          horizontal: AppSpacing.md.w,
        ),
        child:
            hotel == null
                ? const Center(
                  child: CircularProgressIndicator(),
                ) // loading state
                : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text:
                          helper?.tr('hotel_room_screen.rooms_to_clean') ?? '',
                      size: CustomTextSize.lg,
                      fontWeight: FontWeight.bold,
                      color: CustomTextColor.text,
                    ),
                    AppSpacing.vsm,
                    Expanded(
                      child: ListView.builder(
                        itemCount: hotel!["rooms"].length,
                        itemBuilder: (context, index) {
                          final room = hotel!["rooms"][index];
                          return Card(
                            color:
                                isDark
                                    ? AppColors.darkSurface
                                    : AppColors.lightSurface,
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ListTile(
                              leading: Icon(Icons.meeting_room, color: primary),
                              title: CustomText(
                                text: room["roomName"],
                                size: CustomTextSize.md,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
      ),
    );
  }
}
