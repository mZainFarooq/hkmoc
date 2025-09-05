import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/app_colors.dart';
import 'package:flutter_app/core/constants/app_spacing.dart';
import 'package:flutter_app/features/widgets/custom_text.dart';
import 'package:flutter_app/layout/main_layout.dart';
import 'package:flutter_app/provider/language_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with TickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> hotels = [
    {
      "id": "HOTEL-1001",
      "name": "Grand Palace Hotel",
      "date": DateTime(2025, 8, 20),
      "rooms": [
        {"roomName": "Deluxe Suite 101", "status": "incomplete"},
        {"roomName": "Executive Room 202", "status": "complete"},
        {"roomName": "Presidential Suite", "status": "complete"},
      ],
    },
    {
      "id": "HOTEL-1002",
      "name": "Ocean View Resort",
      "date": DateTime(2025, 8, 20),
      "rooms": [
        {"roomName": "Sea View 101", "status": "incomplete"},
        {"roomName": "Family Suite 201", "status": "complete"},
        {"roomName": "Honeymoon Suite", "status": "incomplete"},
      ],
    },
    {
      "id": "HOTEL-1003",
      "name": "Mountain Inn",
      "date": DateTime(2025, 8, 19),
      "rooms": [
        {"roomName": "Hill View 101", "status": "incomplete"},
        {"roomName": "Standard 102", "status": "complete"},
      ],
    },
    {
      "id": "HOTEL-1004",
      "name": "Sunrise Hotel",
      "date": DateTime(2025, 8, 18),
      "rooms": [
        {"roomName": "Sunrise Suite 101", "status": "complete"},
        {"roomName": "Deluxe 201", "status": "incomplete"},
        {"roomName": "Business Suite 301", "status": "incomplete"},
      ],
    },
    {
      "id": "HOTEL-1005",
      "name": "Lakeside Resort",
      "date": DateTime(2025, 8, 18),
      "rooms": [
        {"roomName": "Lake View 101", "status": "incomplete"},
        {"roomName": "Family Suite 201", "status": "complete"},
        {"roomName": "Deluxe Room 301", "status": "incomplete"},
      ],
    },
    {
      "id": "HOTEL-1006",
      "name": "Royal Palace",
      "date": DateTime(2025, 8, 17),
      "rooms": [
        {"roomName": "Royal Suite 101", "status": "complete"},
        {"roomName": "King’s Chamber", "status": "incomplete"},
        {"roomName": "Queen’s Room", "status": "incomplete"},
      ],
    },
    {
      "id": "HOTEL-1007",
      "name": "City Lights Hotel",
      "date": DateTime(2025, 8, 17),
      "rooms": [
        {"roomName": "Penthouse 1201", "status": "complete"},
        {"roomName": "Executive 501", "status": "incomplete"},
        {"roomName": "Business Suite 301", "status": "complete"},
      ],
    },
    {
      "id": "HOTEL-1008",
      "name": "Desert Rose Inn",
      "date": DateTime(2025, 8, 16),
      "rooms": [
        {"roomName": "Oasis Suite 101", "status": "incomplete"},
        {"roomName": "Camel View 102", "status": "complete"},
        {"roomName": "Royal Tent", "status": "incomplete"},
      ],
    },
    {
      "id": "HOTEL-1009",
      "name": "Forest Retreat",
      "date": DateTime(2025, 8, 15),
      "rooms": [
        {"roomName": "Forest View 101", "status": "complete"},
        {"roomName": "Wood Cabin 102", "status": "incomplete"},
        {"roomName": "Treehouse Suite", "status": "incomplete"},
      ],
    },
    {
      "id": "HOTEL-1010",
      "name": "Skyline Tower Hotel",
      "date": DateTime(2025, 8, 15),
      "rooms": [
        {"roomName": "Skyline Suite 1001", "status": "incomplete"},
        {"roomName": "Penthouse 1501", "status": "complete"},
        {"roomName": "Business Lounge Room", "status": "complete"},
      ],
    },
  ];

  String searchQuery = "";
  DateTime? filterFrom;
  DateTime? filterTo;
  Set<String> expandedHotels = {};

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primary = isDark ? AppColors.darkPrimary : AppColors.lightPrimary;
    final languageProvider = Provider.of<LanguageProvider>(context);
    final helper = languageProvider.helper;

    // filter hotels list
    final filteredHotels =
        hotels.where((hotel) {
          final nameMatch = hotel["name"].toString().toLowerCase().contains(
            searchQuery.toLowerCase(),
          );
          final date = hotel["date"] as DateTime;

          final dateMatch =
              (filterFrom == null ||
                  date.isAfter(
                    filterFrom!.subtract(const Duration(days: 1)),
                  )) &&
              (filterTo == null ||
                  date.isBefore(filterTo!.add(const Duration(days: 1))));

          return nameMatch && dateMatch;
        }).toList();

    String heading = "";

    if (searchQuery.isNotEmpty) {
      heading = "";
    } else if (filterFrom != null && filterTo != null) {
      // yahan direct translated "from" aur "to" use karo
      String fromText = helper?.tr('history_screen.from') ?? 'From';
      String toText = helper?.tr('history_screen.to') ?? 'To';

      heading =
          "$fromText ${filterFrom!.toLocal().toString().split(" ").first} "
          "$toText ${filterTo!.toLocal().toString().split(" ").first}";
    } else {
      heading = "today_completed"; // yahan key ka naam hi save karlo
    }

    return MainLayout(
      title: helper?.tr('history_screen.screen_title') ?? '',
      currentIndex: 1,
      isSidebarEnabled: true,
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppSpacing.md.h,
          horizontal: AppSpacing.md.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText:
                    helper?.tr('history_screen.search_placeholder') ?? '',
                prefixIcon: const Icon(Icons.search, size: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor:
                    isDark ? AppColors.darkSurface : AppColors.lightSurface,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 14.h,
                  horizontal: 16.w,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
            AppSpacing.vmd,

            Row(
              children: [
                Expanded(
                  child:
                      heading.isNotEmpty
                          ? CustomText(
                            text:
                                heading == "today_completed"
                                    ? helper?.tr('history_screen.$heading') ??
                                        ''
                                    : heading,
                            size: CustomTextSize.md,
                            fontWeight: FontWeight.bold,
                            color: CustomTextColor.text,
                          )
                          : const SizedBox(),
                ),
                GestureDetector(
                  onTap: () async {
                    final pickedRange = await showDateRangePicker(
                      context: context,
                      firstDate: DateTime(2020),
                      lastDate: DateTime.now(),
                      initialDateRange:
                          filterFrom != null && filterTo != null
                              ? DateTimeRange(
                                start: filterFrom!,
                                end: filterTo!,
                              )
                              : null,
                    );
                    if (pickedRange != null) {
                      setState(() {
                        filterFrom = pickedRange.start;
                        filterTo = pickedRange.end;
                      });
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    decoration: BoxDecoration(
                      color:
                          filterFrom != null && filterTo != null
                              ? primary.withValues(alpha: 0.15)
                              : Colors.transparent,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: primary, width: 1.5),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.filter_list, size: 20),
                        SizedBox(width: 6.w),
                        CustomText(
                          text:
                              helper?.tr('history_screen.filter_by_date') ?? '',
                          size: CustomTextSize.sm,
                          color:
                              filterFrom != null && filterTo != null
                                  ? CustomTextColor.primary
                                  : CustomTextColor.text,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            AppSpacing.vsm,

            Expanded(
              child:
                  filteredHotels.isEmpty
                      ? Center(
                        child: CustomText(
                          text: helper?.tr('history_screen.no_results') ?? '',
                          size: CustomTextSize.sm,
                          fontWeight: FontWeight.normal,
                          color: CustomTextColor.textSecondary,
                        ),
                      )
                      : ListView.builder(
                        itemCount: filteredHotels.length,
                        itemBuilder: (context, index) {
                          final hotel = filteredHotels[index];
                          final isExpanded = expandedHotels.contains(
                            hotel["id"],
                          );

                          int completedCount =
                              hotel["rooms"]
                                  .where((r) => r["status"] == "complete")
                                  .length;
                          int totalCount = hotel["rooms"].length;

                          String completedText = (helper?.tr(
                                    'history_screen.completed_rooms',
                                  ) ??
                                  '')
                              .replaceAll(
                                '{completed}',
                                completedCount.toString(),
                              )
                              .replaceAll('{total}', totalCount.toString());
                          return Card(
                            color:
                                isDark
                                    ? AppColors.darkSurface
                                    : AppColors.lightSurface,
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Icon(Icons.hotel, color: primary),
                                  title: CustomText(
                                    text: hotel["name"],
                                    size: CustomTextSize.md,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  subtitle: CustomText(
                                    text: completedText,
                                    size: CustomTextSize.xs,
                                    color: CustomTextColor.textSecondary,
                                  ),
                                  trailing: IconButton(
                                    icon: Icon(
                                      isExpanded
                                          ? Icons.keyboard_arrow_up
                                          : Icons.keyboard_arrow_down,
                                      color: primary,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (isExpanded) {
                                          expandedHotels.remove(hotel["id"]);
                                        } else {
                                          expandedHotels.add(hotel["id"]);
                                        }
                                      });
                                    },
                                  ),
                                ),
                                AnimatedSize(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                  child:
                                      isExpanded
                                          ? Column(
                                            children:
                                                (hotel["rooms"] as List)
                                                    .map(
                                                      (room) => ListTile(
                                                        leading: Icon(
                                                          room["status"] ==
                                                                  "complete"
                                                              ? Icons
                                                                  .check_circle
                                                              : Icons.cancel,
                                                          color:
                                                              room["status"] ==
                                                                      "complete"
                                                                  ? Colors.green
                                                                  : Colors.red,
                                                        ),
                                                        title: CustomText(
                                                          text:
                                                              room["roomName"],
                                                          size:
                                                              CustomTextSize.sm,
                                                        ),
                                                      ),
                                                    )
                                                    .toList(),
                                          )
                                          : const SizedBox.shrink(),
                                ),
                              ],
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
