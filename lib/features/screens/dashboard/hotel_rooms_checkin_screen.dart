import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/app_colors.dart';
import 'package:flutter_app/core/constants/app_spacing.dart';
import 'package:flutter_app/core/utils/file_utils.dart';
import 'package:flutter_app/features/screens/dashboard/dashboard_screen.dart';
import 'package:flutter_app/features/widgets/custom_button.dart';
import 'package:flutter_app/features/widgets/custom_popup.dart';
import 'package:flutter_app/features/widgets/custom_text.dart';
import 'package:flutter_app/layout/main_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
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

  List<String> _selectedFiles = []; // 👈 selected files list

  @override
  void initState() {
    super.initState();
    loadHotelData();
    _initializeTimer();
  }

  Future<void> updateHotelCheckIn(String hotelId, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    final hotelsString = prefs.getString('hotels');

    if (hotelsString != null) {
      List<dynamic> hotelsList = jsonDecode(hotelsString);

      for (var hotel in hotelsList) {
        if (hotel['id'] == hotelId) {
          hotel['isCheckin'] = value;
          break;
        }
      }

      await prefs.setString('hotels', jsonEncode(hotelsList));
    }
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

  Future<void> _initializeTimer() async {
    final prefs = await SharedPreferences.getInstance();
    final int? checkInTime = prefs.getInt('checkInTime');

    if (checkInTime != null) {
      final int elapsedSeconds =
          ((DateTime.now().millisecondsSinceEpoch - checkInTime) ~/ 1000);
      seconds = elapsedSeconds;
    }

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        seconds++;
      });
    });

    setState(() {});
  }

  String _formatTime(int totalSeconds) {
    final h = (totalSeconds ~/ 3600).toString().padLeft(2, '0');
    final m = ((totalSeconds % 3600) ~/ 60).toString().padLeft(2, '0');
    final s = (totalSeconds % 60).toString().padLeft(2, '0');
    return "$h:$m:$s";
  }

  void _openFilePopup(List<String> files) async {
    _selectedFiles = [...files, ..._selectedFiles];

    int selectedIndex = 0;
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        bool isDark = Theme.of(context).brightness == Brightness.dark;
        return FractionallySizedBox(
          heightFactor: 0.7,
          child: StatefulBuilder(
            builder: (context, setState) {
              bool isImage(String path) {
                final ext = path.split('.').last.toLowerCase();
                return [
                  'jpg',
                  'jpeg',
                  'png',
                  'gif',
                  'bmp',
                  'webp',
                ].contains(ext);
              }

              void removeFile(int index) {
                setState(() {
                  _selectedFiles.removeAt(index);
                  if (selectedIndex >= _selectedFiles.length) {
                    selectedIndex =
                        _selectedFiles.isEmpty ? 0 : _selectedFiles.length - 1;
                  }
                });
              }

              return Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom + 16,
                  left: 16,
                  right: 16,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                ),
                child: Column(
                  children: [
                    // Heading + Close button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: "Preview",
                          fontWeight: FontWeight.w600,
                          size: CustomTextSize.md,
                          fontFamily: "Poppins",
                          color: CustomTextColor.text,
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            _selectedFiles.clear();
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    if (_selectedFiles.isNotEmpty)
                      Flexible(
                        child: ListView(
                          children: [
                            _selectedFiles[selectedIndex]
                                    .split('.')
                                    .last
                                    .toLowerCase()
                                    .contains(
                                      RegExp(r'jpg|jpeg|png|gif|bmp|webp'),
                                    )
                                ? Container(
                                  width: double.infinity,
                                  margin: const EdgeInsets.only(bottom: 12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.grey.shade200,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.file(
                                      File(_selectedFiles[selectedIndex]),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                )
                                : Container(
                                  width: double.infinity,
                                  height: 200,
                                  margin: const EdgeInsets.only(bottom: 12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color:
                                        isDark
                                            ? AppColors.darkSurface
                                            : AppColors.lightSurface,
                                  ),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.insert_drive_file,
                                          size: 50,
                                          color: AppColors.darkPrimary,
                                        ),
                                        const SizedBox(height: 8),
                                        CustomText(
                                          text:
                                              _selectedFiles[selectedIndex]
                                                  .split('/')
                                                  .last,
                                          textAlign: TextAlign.center,
                                          size: CustomTextSize.sm,
                                          color: CustomTextColor.text,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                            const SizedBox(height: 8),

                            SizedBox(
                              height: 90,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: _selectedFiles.length,
                                separatorBuilder:
                                    (_, __) => const SizedBox(width: 8),
                                itemBuilder: (context, index) {
                                  final path = _selectedFiles[index];
                                  final isSelected = index == selectedIndex;

                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = index;
                                      });
                                    },
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: 80,
                                          height: 80,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                            border:
                                                isSelected
                                                    ? Border.all(
                                                      color:
                                                          Theme.of(
                                                                    context,
                                                                  ).brightness ==
                                                                  Brightness
                                                                      .dark
                                                              ? AppColors
                                                                  .darkPrimary
                                                              : AppColors
                                                                  .lightPrimary,
                                                      width: 2,
                                                    )
                                                    : null,
                                            color: Colors.grey.shade300,
                                          ),
                                          child:
                                              isImage(path)
                                                  ? ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          8,
                                                        ),
                                                    child: Image.file(
                                                      File(path),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  )
                                                  : Center(
                                                    child: Icon(
                                                      Icons.insert_drive_file,
                                                      size: 40,
                                                      color:
                                                          Theme.of(
                                                                    context,
                                                                  ).brightness ==
                                                                  Brightness
                                                                      .dark
                                                              ? AppColors
                                                                  .darkPrimary
                                                              : AppColors
                                                                  .lightPrimary,
                                                    ),
                                                  ),
                                        ),
                                        Positioned(
                                          right: 0,
                                          top: 0,
                                          child: InkWell(
                                            onTap: () => removeFile(index),
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.red,
                                              ),
                                              padding: const EdgeInsets.all(2),
                                              child: const Icon(
                                                Icons.close,
                                                color: Colors.white,
                                                size: 14,
                                              ),
                                            ),
                                          ),
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

                    const SizedBox(height: 16),

                    // Bottom row (Submit + SpeedDial)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SpeedDial(
                          icon: Icons.menu,
                          activeIcon: Icons.close,
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.white,
                          children: [
                            SpeedDialChild(
                              child: const Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.white,
                              ),
                              backgroundColor: Colors.orange,
                              label: "Camera",
                              onTap: () async {
                                final images =
                                    await FileUtils.pickMultipleImages();
                                if (images != null && images.isNotEmpty) {
                                  setState(() {
                                    _selectedFiles.insertAll(0, images);
                                  });
                                }
                              },
                            ),
                            SpeedDialChild(
                              child: const Icon(
                                Icons.attach_file_outlined,
                                color: Colors.white,
                              ),
                              backgroundColor: Colors.orange,
                              label: "Attach File",
                              onTap: () async {
                                final docs =
                                    await FileUtils.pickMultipleDocuments();
                                if (docs != null && docs.isNotEmpty) {
                                  setState(() {
                                    _selectedFiles.insertAll(0, docs);
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                        AppSpacing.hmd,
                        Expanded(
                          child: CustomButton(
                            text: "Submit",
                            onPressed: () async {
                              final prefs =
                                  await SharedPreferences.getInstance();
                              final String? currentHotelId = hotel?['id'];

                              // Show confirmation popup
                              CustomPopup.show(
                                context,
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CustomText(
                                      text: "Are you sure to submit?",
                                      size: CustomTextSize.lg,
                                      fontWeight: FontWeight.bold,
                                      color: CustomTextColor.text,
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 20.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: CustomButton(
                                            text: "No",
                                            variant: ButtonVariant.outline,
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ),
                                        SizedBox(width: 12.w),
                                        Expanded(
                                          child: CustomButton(
                                            text: "Yes",
                                            onPressed: () async {
                                              Navigator.pop(context);

                                              if (currentHotelId != null) {
                                                await updateHotelCheckIn(
                                                  currentHotelId,
                                                  false,
                                                );
                                              }

                                              await prefs.remove('checkInTime');
                                              await prefs.setBool(
                                                'hasCheckedIn',
                                                false,
                                              );
                                              await prefs.remove(
                                                'checkedInHotelId',
                                              );

                                              Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                  builder:
                                                      (_) => DashboardScreen(),
                                                ),
                                                (route) => false,
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );

    _selectedFiles.clear();
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
      child: MainLayout(
        title: widget.hotelName,
        showBottomNav: false,
        currentIndex: 0,
        isBackAction: true,
        isActionsShow: false,
        isCheckOutBtnShow: true,
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
                        child: Column(
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
                                                : AppColors.lightSurface,
                                        margin: const EdgeInsets.symmetric(
                                          vertical: 4,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
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
                                                    (room["isChecked"] ?? false)
                                                        ? primary
                                                        : Colors.transparent,
                                              ),
                                              child:
                                                  (room["isChecked"] ?? false)
                                                      ? const Icon(
                                                        Icons.check,
                                                        color: Colors.white,
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

                            /// Bottom Row with Submit + SpeedDial
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SpeedDial(
                                  icon: Icons.menu,
                                  activeIcon: Icons.close,
                                  backgroundColor: Colors.orange,
                                  foregroundColor: Colors.white,
                                  spacing: 10,
                                  animationDuration: const Duration(
                                    milliseconds: 200,
                                  ),
                                  curve: Curves.easeInOut,
                                  children: [
                                    SpeedDialChild(
                                      child: const Icon(
                                        Icons.camera_alt_outlined,
                                        color: Colors.white,
                                      ),
                                      backgroundColor: Colors.orange,
                                      label: "Camera",
                                      onTap: () async {
                                        final images =
                                            await FileUtils.pickMultipleImages();
                                        if (images != null &&
                                            images.isNotEmpty) {
                                          _openFilePopup(images);
                                        }
                                      },
                                    ),
                                    SpeedDialChild(
                                      child: const Icon(
                                        Icons.attach_file_outlined,
                                        color: Colors.white,
                                      ),
                                      backgroundColor: Colors.orange,
                                      label: "Attach File",
                                      onTap: () async {
                                        final docs =
                                            await FileUtils.pickMultipleDocuments();
                                        if (docs != null && docs.isNotEmpty) {
                                          _openFilePopup(docs);
                                        }
                                      },
                                    ),
                                  ],
                                ),
                                AppSpacing.hmd,
                                Expanded(
                                  child: CustomButton(
                                    text: "Submit",
                                    onPressed: () async {
                                      final prefs =
                                          await SharedPreferences.getInstance();
                                      final String? currentHotelId =
                                          hotel?['id'];

                                      CustomPopup.show(
                                        context,
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            CustomText(
                                              text: "Are you sure to submit?",
                                              size: CustomTextSize.lg,
                                              fontWeight: FontWeight.bold,
                                              color: CustomTextColor.text,
                                              textAlign: TextAlign.center,
                                            ),
                                            SizedBox(height: 20.h),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Expanded(
                                                  child: CustomButton(
                                                    text: "No",
                                                    variant:
                                                        ButtonVariant.outline,
                                                    onPressed: () {
                                                      Navigator.of(
                                                        context,
                                                      ).pop();
                                                    },
                                                  ),
                                                ),
                                                SizedBox(width: 12.w),
                                                Expanded(
                                                  child: CustomButton(
                                                    text: "Yes",
                                                    onPressed: () async {
                                                      Navigator.pop(context);

                                                      if (currentHotelId !=
                                                          null) {
                                                        await updateHotelCheckIn(
                                                          currentHotelId,
                                                          false,
                                                        );
                                                      }

                                                      // SharedPreferences update karo
                                                      await prefs.remove(
                                                        'checkInTime',
                                                      );
                                                      await prefs.setBool(
                                                        'hasCheckedIn',
                                                        false,
                                                      );
                                                      await prefs.remove(
                                                        'checkedInHotelId',
                                                      );

                                                      // Dashboard pe navigate karo
                                                      Navigator.pushAndRemoveUntil(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder:
                                                              (_) =>
                                                                  DashboardScreen(),
                                                        ),
                                                        (route) => false,
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
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
