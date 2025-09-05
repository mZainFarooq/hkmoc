import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/app_assets.dart';
import 'package:flutter_app/core/constants/app_colors.dart';
import 'package:flutter_app/core/constants/app_spacing.dart';
import 'package:flutter_app/core/utils/custom_navigation.dart';
import 'package:flutter_app/features/screens/dashboard/hotel_rooms_checkin_screen.dart';
import 'package:flutter_app/features/screens/dashboard/hotel_rooms_screen.dart';
import 'package:flutter_app/features/widgets/custom_button.dart';
import 'package:flutter_app/features/widgets/custom_text.dart';
import 'package:flutter_app/layout/main_layout.dart';
import 'package:flutter_app/provider/language_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Map<String, dynamic>> hotels = [];

  @override
  void initState() {
    super.initState();
    loadHotels();
  }

  Future<void> loadHotels() async {
    final prefs = await SharedPreferences.getInstance();
    final String? hotelsString = prefs.getString('hotels');
    if (hotelsString != null) {
      setState(() {
        hotels = List<Map<String, dynamic>>.from(json.decode(hotelsString));
      });
    } else {
      setState(() {
        hotels = [
          {
            "id": "HOTEL-1001-XYZ-AB12",
            "name": "Grand Palace Hotel",
            "roomsToClean": 12,
            "isCheckin": false,
            "rooms": [
              {
                "roomId": "ROOM-1001-1",
                "roomName": "Deluxe Suite 101",
                "status": "incomplete",
              },
              {
                "roomId": "ROOM-1001-2",
                "roomName": "Executive Room 202",
                "status": "complete",
              },
              {
                "roomId": "ROOM-1001-3",
                "roomName": "Presidential Suite",
                "status": "incomplete",
              },
              {
                "roomId": "ROOM-1001-4",
                "roomName": "Standard Room 303",
                "status": "incomplete",
              },
              {
                "roomId": "ROOM-1001-5",
                "roomName": "Family Suite 404",
                "status": "complete",
              },
            ],
          },
          {
            "id": "HOTEL-1002-XYZ-AB12",
            "name": "Ocean View Resort",
            "roomsToClean": 8,
            "isCheckin": false,
            "rooms": [
              {
                "roomId": "ROOM-1002-1",
                "roomName": "Sea View 101",
                "status": "incomplete",
              },
              {
                "roomId": "ROOM-1002-2",
                "roomName": "Sea View 102",
                "status": "incomplete",
              },
              {
                "roomId": "ROOM-1002-3",
                "roomName": "Family Suite 201",
                "status": "complete",
              },
              {
                "roomId": "ROOM-1002-4",
                "roomName": "Honeymoon Suite",
                "status": "incomplete",
              },
              {
                "roomId": "ROOM-1002-5",
                "roomName": "Penthouse 501",
                "status": "complete",
              },
            ],
          },
          {
            "id": "HOTEL-1003-XYZ-AB12",
            "name": "Mountain Inn",
            "roomsToClean": 5,
            "isCheckin": false,
            "rooms": [
              {
                "roomId": "ROOM-1003-1",
                "roomName": "Hill View 101",
                "status": "incomplete",
              },
              {
                "roomId": "ROOM-1003-2",
                "roomName": "Standard 102",
                "status": "complete",
              },
              {
                "roomId": "ROOM-1003-3",
                "roomName": "Cabin Suite",
                "status": "incomplete",
              },
            ],
          },
        ];
      });

      await prefs.setString('hotels', jsonEncode(hotels));
      saveHotels();
    }
  }

  String getFormattedDate() {
    return DateFormat('EEEE, MMM d, yyyy').format(DateTime.now());
  }

  Future<void> saveHotels() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('hotels', json.encode(hotels));
  }

  void markHotelAsCleaned(int index) {
    setState(() {
      hotels.removeAt(index);
    });
    saveHotels();
  }

  void updateHotelCheckInFromAppBar(String hotelId) async {
    final prefs = await SharedPreferences.getInstance();
    final hotelsString = prefs.getString('hotels');

    if (hotelsString != null) {
      List<dynamic> hotelsList = jsonDecode(hotelsString);

      for (var hotel in hotelsList) {
        if (hotel['id'] == hotelId) {
          hotel['isCheckin'] = true;
          break;
        }
      }

      await prefs.setString('hotels', jsonEncode(hotelsList));

      setState(() {
        hotels = List<Map<String, dynamic>>.from(hotelsList);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primary = isDark ? AppColors.darkPrimary : AppColors.lightPrimary;
    final languageProvider = Provider.of<LanguageProvider>(context);
    final helper = languageProvider.helper;
    return MainLayout(
      title: helper?.tr('dashboard_screen.screen_title') ?? '',
      currentIndex: 0,
      isSidebarEnabled: true,
      onCheckedIn: () {
        loadHotels();
      },
      body: Padding(
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
                  radius: 26,
                  backgroundImage: AssetImage(avatarImage),
                ),
                const SizedBox(width: 14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text:
                          "${helper?.tr('dashboard_screen.greeting') ?? ''}, Muhammad Zain",

                      size: CustomTextSize.lg,
                      fontWeight: FontWeight.bold,
                      color: CustomTextColor.text,
                    ),
                    const SizedBox(height: 4),
                    CustomText(
                      text: getFormattedDate(),
                      size: CustomTextSize.sm,
                      color: CustomTextColor.textSecondary,
                    ),
                  ],
                ),
              ],
            ),

            AppSpacing.vlg,
            CustomText(
              text: helper?.tr('dashboard_screen.assigned_hotels') ?? '',
              size: CustomTextSize.md,
              color: CustomTextColor.text,
              fontWeight: FontWeight.w600,
            ),
            AppSpacing.vxs,
            Expanded(
              child:
                  hotels.isEmpty
                      ? Center(
                        child: CustomText(
                          text:
                              helper?.tr(
                                'dashboard_screen.no_hotels_assigned',
                              ) ??
                              '',
                          size: CustomTextSize.md,
                          color: CustomTextColor.textSecondary,
                        ),
                      )
                      : ListView.builder(
                        itemCount: hotels.length,
                        itemBuilder: (context, index) {
                          final hotel = hotels[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 2),
                            child: Material(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(12),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(12),
                                splashColor: primary.withValues(alpha: 0.2),
                                onTap: () async {
                                  final prefs =
                                      await SharedPreferences.getInstance();
                                  final hotelsString = prefs.getString(
                                    'hotels',
                                  );

                                  if (hotelsString != null) {
                                    List<dynamic> hotelsList = jsonDecode(
                                      hotelsString,
                                    );
                                    final currentHotel = hotelsList.firstWhere(
                                      (h) => h['id'] == hotel['id'],
                                    );
                                    if (currentHotel['isCheckin'] == true) {
                                      CustomNavigation.push(
                                        context,
                                        HotelRoomsWithCheckIn(
                                          hotelId: hotel["id"],
                                          hotelName: hotel["name"],
                                        ),
                                      );
                                    } else {
                                      CustomNavigation.push(
                                        context,
                                        HotelRoomsScreen(
                                          hotelId: hotel["id"],
                                          hotelName: hotel["name"],
                                        ),
                                      );
                                    }
                                  }
                                },

                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:
                                          isDark
                                              ? AppColors.darkSurface
                                              : AppColors.lightSurface,
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              isDark
                                                  ? AppColors.lightBackground
                                                      .withValues(alpha: 0.08)
                                                  : AppColors.darkBackground
                                                      .withValues(alpha: 0.08),
                                          blurRadius: 8,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(
                                                10,
                                              ), // icon ke around spacing
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: primary.withValues(
                                                  alpha: 0.15,
                                                ), // halka background color
                                              ),
                                              child: Icon(
                                                Icons.hotel,
                                                color:
                                                    primary, // icon ka asli color
                                                size: 26,
                                              ),
                                            ),

                                            const SizedBox(width: 10),
                                            Expanded(
                                              child: CustomText(
                                                text:
                                                    hotel['name'] ??
                                                    "Hotel Name",
                                                color: CustomTextColor.text,
                                                size: CustomTextSize.md,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 38,
                                              width: 38,
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  CircularProgressIndicator(
                                                    value: 0.7,
                                                    strokeWidth: 4,
                                                    color: primary,
                                                    backgroundColor:
                                                        Colors.grey.shade200,
                                                  ),
                                                  CustomText(
                                                    text: "8/12",
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        CustomTextColor.primary,
                                                    size: CustomTextSize.xs,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          height: 24,
                                          color:
                                              isDark
                                                  ? AppColors.darkTextSecondary
                                                  : AppColors
                                                      .lightTextSecondary,
                                          thickness: 1,
                                        ),

                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomButton(
                                              text:
                                                  helper?.tr(
                                                    'dashboard_screen.see_details',
                                                  ) ??
                                                  '',
                                              onPressed: () {},
                                              variant: ButtonVariant.outline,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                    vertical: 10,
                                                  ),
                                            ),
                                            CustomButton(
                                              text:
                                                  helper?.tr(
                                                    'dashboard_screen.check_in',
                                                  ) ??
                                                  '',
                                              onPressed: () {},
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                    vertical: 10,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
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
