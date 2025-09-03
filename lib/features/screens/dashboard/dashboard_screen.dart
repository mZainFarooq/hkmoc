import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/app_colors.dart';
import 'package:flutter_app/core/constants/app_spacing.dart';
import 'package:flutter_app/core/utils/custom_navigation.dart';
import 'package:flutter_app/features/screens/dashboard/hotel_rooms_screen.dart';
import 'package:flutter_app/features/widgets/custom_text.dart';
import 'package:flutter_app/layout/main_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
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
          {
            "id": "HOTEL-1004-XYZ-AB12",
            "name": "Sunrise Hotel",
            "roomsToClean": 7,
            "isCheckin": false,
            "rooms": [
              {
                "roomId": "ROOM-1004-1",
                "roomName": "Sunrise Suite 101",
                "status": "complete",
              },
              {
                "roomId": "ROOM-1004-2",
                "roomName": "Deluxe 201",
                "status": "incomplete",
              },
              {
                "roomId": "ROOM-1004-3",
                "roomName": "Business Suite 301",
                "status": "incomplete",
              },
              {
                "roomId": "ROOM-1004-4",
                "roomName": "Presidential Suite",
                "status": "complete",
              },
            ],
          },
          {
            "id": "HOTEL-1005-XYZ-AB12",
            "name": "Lakeside Resort",
            "roomsToClean": 10,
            "isCheckin": false,
            "rooms": [
              {
                "roomId": "ROOM-1005-1",
                "roomName": "Lake View 101",
                "status": "incomplete",
              },
              {
                "roomId": "ROOM-1005-2",
                "roomName": "Lake View 102",
                "status": "incomplete",
              },
              {
                "roomId": "ROOM-1005-3",
                "roomName": "Family Suite 201",
                "status": "complete",
              },
              {
                "roomId": "ROOM-1005-4",
                "roomName": "Honeymoon Suite",
                "status": "complete",
              },
              {
                "roomId": "ROOM-1005-5",
                "roomName": "Deluxe Room 301",
                "status": "incomplete",
              },
            ],
          },
          {
            "id": "HOTEL-1006-XYZ-AB12",
            "name": "Royal Palace",
            "roomsToClean": 4,
            "isCheckin": false,
            "rooms": [
              {
                "roomId": "ROOM-1006-1",
                "roomName": "Royal Suite 101",
                "status": "complete",
              },
              {
                "roomId": "ROOM-1006-2",
                "roomName": "King’s Chamber",
                "status": "incomplete",
              },
              {
                "roomId": "ROOM-1006-3",
                "roomName": "Queen’s Room",
                "status": "incomplete",
              },
            ],
          },
          {
            "id": "HOTEL-1007-XYZ-AB12",
            "name": "City Lights Hotel",
            "roomsToClean": 15,
            "isCheckin": false,
            "rooms": [
              {
                "roomId": "ROOM-1007-1",
                "roomName": "Penthouse 1201",
                "status": "complete",
              },
              {
                "roomId": "ROOM-1007-2",
                "roomName": "Executive 501",
                "status": "incomplete",
              },
              {
                "roomId": "ROOM-1007-3",
                "roomName": "Business Suite 301",
                "status": "complete",
              },
              {
                "roomId": "ROOM-1007-4",
                "roomName": "Standard Room 401",
                "status": "incomplete",
              },
            ],
          },
          {
            "id": "HOTEL-1008-XYZ-AB12",
            "name": "Desert Rose Inn",
            "roomsToClean": 9,
            "isCheckin": false,
            "rooms": [
              {
                "roomId": "ROOM-1008-1",
                "roomName": "Oasis Suite 101",
                "status": "incomplete",
              },
              {
                "roomId": "ROOM-1008-2",
                "roomName": "Camel View 102",
                "status": "complete",
              },
              {
                "roomId": "ROOM-1008-3",
                "roomName": "Desert Villa 201",
                "status": "incomplete",
              },
              {
                "roomId": "ROOM-1008-4",
                "roomName": "Royal Tent",
                "status": "incomplete",
              },
            ],
          },
          {
            "id": "HOTEL-1009-XYZ-AB12",
            "name": "Forest Retreat",
            "roomsToClean": 6,
            "isCheckin": false,
            "rooms": [
              {
                "roomId": "ROOM-1009-1",
                "roomName": "Forest View 101",
                "status": "complete",
              },
              {
                "roomId": "ROOM-1009-2",
                "roomName": "Wood Cabin 102",
                "status": "incomplete",
              },
              {
                "roomId": "ROOM-1009-3",
                "roomName": "Treehouse Suite",
                "status": "incomplete",
              },
            ],
          },
          {
            "id": "HOTEL-1010-XYZ-AB12",
            "name": "Skyline Tower Hotel",
            "roomsToClean": 11,
            "isCheckin": false,
            "rooms": [
              {
                "roomId": "ROOM-1010-1",
                "roomName": "Skyline Suite 1001",
                "status": "incomplete",
              },
              {
                "roomId": "ROOM-1010-2",
                "roomName": "Penthouse 1501",
                "status": "complete",
              },
              {
                "roomId": "ROOM-1010-3",
                "roomName": "Executive Floor 501",
                "status": "incomplete",
              },
              {
                "roomId": "ROOM-1010-4",
                "roomName": "Standard Room 301",
                "status": "incomplete",
              },
              {
                "roomId": "ROOM-1010-5",
                "roomName": "Business Lounge Room",
                "status": "complete",
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
    return MainLayout(
      title: "Dashboard",
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
            CustomText(
              text: "Hello, Charlotte Elizabeth",
              size: CustomTextSize.lg,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
            ),
            AppSpacing.vxs,
            CustomText(
              text: getFormattedDate(),
              size: CustomTextSize.sm,
              color: CustomTextColor.textSecondary,
            ),
            AppSpacing.vlg,
            CustomText(
              text: "Assigned Hotels",
              size: CustomTextSize.md,
              color: CustomTextColor.text,
              fontWeight: FontWeight.w600,
            ),
            AppSpacing.vsm,
            Expanded(
              child:
                  hotels.isEmpty
                      ? Center(
                        child: CustomText(
                          text: 'No hotels assigned!',
                          size: CustomTextSize.md,
                          color: CustomTextColor.textSecondary,
                        ),
                      )
                      : GridView.builder(
                        itemCount: hotels.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.9,
                              crossAxisSpacing: 2,
                              mainAxisSpacing: 4,
                            ),

                        itemBuilder: (context, index) {
                          final hotel = hotels[index];
                          return Material(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(12),
                              splashColor: primary.withValues(alpha: 0.2),
                              onTap: () {
                                // final bool isCheckin =
                                //     hotel['isCheckin'] ?? false;

                                // if (isCheckin) {
                                //   Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder:
                                //           (context) => HotelRoomsWithCheckIn(
                                //             hotelId: hotel["id"],
                                //             hotelName: hotel["name"],
                                //           ),
                                //     ),
                                //   ).then((value) {
                                //     if (value == true) {
                                //       loadHotels(); // 👈 Refresh hotels data
                                //     }
                                //   });
                                // } else {
                                //   Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder:
                                //           (context) => HotelRoomsScreen(
                                //             hotelId: hotel["id"],
                                //             hotelName: hotel["name"],
                                //           ),
                                //     ),
                                //   ).then((value) {
                                //     if (value == true) {
                                //       loadHotels(); // 👈 Refresh hotels data
                                //     }
                                //   });
                                // }
                                CustomNavigation.push(
                                  context,
                                  HotelRoomsScreen(
                                    hotelId: hotel["id"],
                                    hotelName: hotel["name"],
                                  ),
                                );
                              },

                              child: Card(
                                color:
                                    isDark
                                        ? AppColors.darkSurface
                                        : AppColors.lightSurface,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.hotel,
                                        size: 24.sp,
                                        color: primary,
                                      ),
                                      AppSpacing.vmd,
                                      CustomText(
                                        text: hotel['name'],
                                        size: CustomTextSize.md,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      const Spacer(),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: primary.withValues(alpha: 0.2),
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.cleaning_services,
                                              size: 16,
                                              color: primary,
                                            ),
                                            AppSpacing.hsm,
                                            CustomText(
                                              text:
                                                  '${hotel['roomsToClean']} rooms',
                                              size: CustomTextSize.sm,
                                              fontWeight: FontWeight.w600,
                                              color: CustomTextColor.primary,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
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
