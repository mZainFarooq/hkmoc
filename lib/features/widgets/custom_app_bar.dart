import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/app_spacing.dart';
import 'package:flutter_app/core/utils/custom_navigation.dart';
import 'package:flutter_app/features/screens/dashboard/dashboard_screen.dart';
import 'package:flutter_app/features/screens/dashboard/hotel_rooms_checkin_screen.dart';
import 'package:flutter_app/features/screens/notfications/notifcations_screen.dart';
import 'package:flutter_app/features/widgets/custom_button.dart';
import 'package:flutter_app/features/widgets/custom_popup.dart';
import 'package:flutter_app/features/widgets/language_popup_content.dart';
import 'package:flutter_app/l10n/app_localizations.dart';
import 'package:flutter_app/provider/language_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app/core/constants/app_colors.dart';
import 'package:flutter_app/features/widgets/custom_text.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/theme/theme_provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isUser;
  final bool isBackAction;
  final bool isAvatarShow;
  final Map<String, dynamic>? user;
  final bool isSidebarEnabled;
  final VoidCallback? onMenuPressed;
  final bool isNotficationIcon;
  final bool isActionsShow;
  final bool isCheckIn;
  final bool isCheckOutBtnShow;
  final Map<String, dynamic>? hotelInfo;
  final VoidCallback? onCheckedIn;

  const CustomAppBar({
    super.key,
    required this.title,
    this.isUser = false,
    this.isBackAction = false,
    this.isAvatarShow = true,
    this.user,
    this.isSidebarEnabled = false,
    this.isNotficationIcon = true,
    this.isActionsShow = true,
    this.onMenuPressed,
    this.hotelInfo,
    this.isCheckIn = false,
    this.onCheckedIn,
    this.isCheckOutBtnShow = false,
  });

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

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.themeMode == ThemeMode.dark;
    final themeIcon = isDarkMode ? Icons.dark_mode : Icons.light_mode;
    final local = AppLocalizations.of(context)!;

    return AppBar(
      automaticallyImplyLeading: false,
      leading:
          isBackAction
              ? IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color:
                      isDarkMode
                          ? AppColors.lightSurface
                          : AppColors.darkSurface,
                ),
                onPressed: () => Navigator.pop(context),
              )
              : isSidebarEnabled
              ? IconButton(
                icon: Icon(
                  Icons.menu,
                  color:
                      isDarkMode
                          ? AppColors.lightSurface
                          : AppColors.darkSurface,
                ),
                onPressed: onMenuPressed,
              )
              : null,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (user != null)
            (user!['avatarUrl'] != null &&
                    user!['avatarUrl'].toString().isNotEmpty
                ? Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(user!['avatarUrl']),
                    radius: 16.r,
                  ),
                )
                : Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: CircleAvatar(
                    radius: 16.r,
                    backgroundColor: AppColors.lightPrimary,
                    child: Text(
                      user!['name'] != null &&
                              user!['name'].toString().isNotEmpty
                          ? user!['name'][0]
                          : '',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                )),
          Expanded(
            child: CustomText(
              text: title,
              size: CustomTextSize.lg,
              fontWeight: FontWeight.w600,
              color: CustomTextColor.text,
              textAlign: TextAlign.left,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      actions: [
        if (isCheckIn)
          Container(
            margin: EdgeInsets.only(right: 12.w),
            child: CustomButton(
              text: local.appBarWidgetCheckin,
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();

                final bool hasCheckedIn =
                    prefs.getBool('hasCheckedIn') ?? false;
                final String? currentHotelId = hotelInfo?['hotelId'];

                if (hasCheckedIn && currentHotelId != null) {
                  final String? checkedInHotelId = prefs.getString(
                    'checkedInHotelId',
                  );
                  if (checkedInHotelId != currentHotelId) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "You are already checked in somewhere else. Please complete your current check-in first.",
                          style: TextStyle(color: Colors.red),
                        ),
                        duration: Duration(seconds: 3),
                      ),
                    );
                    return;
                  }
                }

                CustomPopup.show(
                  context,
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(
                        text: local.checkinPopupConfirmationMessage,
                        size: CustomTextSize.lg,
                        fontWeight: FontWeight.bold,
                        color: CustomTextColor.text,
                        textAlign: TextAlign.center,
                      ),
                      AppSpacing.vmd,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: CustomButton(
                              text: local.checkinPopupNo,
                              variant: ButtonVariant.outline,
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                          AppSpacing.hsm,
                          Expanded(
                            child: CustomButton(
                              text: local.checkinPopupYes,
                              onPressed: () async {
                                Navigator.pop(context);

                                if (currentHotelId != null) {
                                  await updateHotelCheckIn(
                                    currentHotelId,
                                    true,
                                  );

                                  final checkInTime =
                                      DateTime.now().millisecondsSinceEpoch;
                                  await prefs.setInt(
                                    'checkInTime',
                                    checkInTime,
                                  );

                                  await prefs.setBool('hasCheckedIn', true);
                                  await prefs.setString(
                                    'checkedInHotelId',
                                    currentHotelId,
                                  );
                                }

                                if (onCheckedIn != null) {
                                  onCheckedIn!();
                                }

                                await Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (_) => HotelRoomsWithCheckIn(
                                          hotelId: currentHotelId!,
                                          hotelName: hotelInfo?["hotelName"],
                                        ),
                                    settings: const RouteSettings(
                                      name: "HotelRoomsWithCheckIn",
                                    ),
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
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            ),
          )
        else if (isCheckOutBtnShow)
          Container(
            margin: EdgeInsets.only(right: 12.w),
            child: CustomButton(
              text: local.appBarWidgetCheckin,
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                final String? currentHotelId = hotelInfo?['hotelId'];

                CustomPopup.show(
                  context,
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(
                        text: local.checkoutPopupConfirmationMessage,
                        size: CustomTextSize.lg,
                        fontWeight: FontWeight.bold,
                        color: CustomTextColor.text,
                        textAlign: TextAlign.center,
                      ),
                      AppSpacing.vmd,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: CustomButton(
                              text: local.checkinPopupNo,
                              variant: ButtonVariant.outline,
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                          AppSpacing.hsm,
                          Expanded(
                            child: CustomButton(
                              text: local.checkoutPopupYes,
                              onPressed: () async {
                                Navigator.pop(context);

                                if (currentHotelId != null) {
                                  await updateHotelCheckIn(
                                    currentHotelId,
                                    false,
                                  );
                                }

                                await prefs.remove('checkInTime');
                                await prefs.setBool('hasCheckedIn', false);
                                await prefs.remove('checkedInHotelId');

                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => DashboardScreen(),
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
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            ),
          )
        else if (isActionsShow)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isNotficationIcon)
                Container(
                  margin: EdgeInsets.only(right: 12.w),
                  child: GestureDetector(
                    onTap: () {
                      CustomNavigation.push(context, NotificationsScreen());
                    },
                    child: Icon(
                      Icons.notifications,
                      color:
                          isDarkMode
                              ? AppColors.lightSurface
                              : AppColors.darkSurface,
                      size: 22.sp,
                    ),
                  ),
                ),
              Container(
                margin: EdgeInsets.only(right: 12.w),
                child: GestureDetector(
                  onTap: () {
                    CustomPopup.show(
                      context,
                      content: LanguagePopupWidget(
                        languages: [
                          {'name': 'en', 'flag': '🇬🇧', 'display': 'English'},
                          {'name': 'de', 'flag': '🇩🇪', 'display': 'German'},
                        ],
                        selectedLanguage:
                            Provider.of<LanguageProvider>(
                              context,
                              listen: false,
                            ).locale,
                        onSelected: (lang) {
                          print('User selected: $lang');
                        },
                      ),
                    );
                  },
                  child: Icon(
                    Icons.language,
                    color:
                        isDarkMode
                            ? AppColors.lightSurface
                            : AppColors.darkSurface,
                    size: 22.sp,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 12.w),
                child: GestureDetector(
                  onTap: () {
                    themeProvider.toggleTheme(!isDarkMode);
                  },
                  child: Icon(
                    themeIcon,
                    color:
                        isDarkMode
                            ? AppColors.lightSurface
                            : AppColors.darkSurface,
                    size: 22.sp,
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight.h);
}
