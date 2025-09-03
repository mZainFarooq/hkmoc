import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/custom_navigation.dart';
import 'package:flutter_app/features/screens/dashboard/hotel_rooms_checkin_screen.dart';
import 'package:flutter_app/features/screens/notfications/notifcations_screen.dart';
import 'package:flutter_app/features/widgets/custom_button.dart';
import 'package:flutter_app/features/widgets/custom_popup.dart';
import 'package:flutter_app/features/widgets/language_popup_content.dart';
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

  final bool isCheckIn;
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
    this.onMenuPressed,
    this.hotelInfo,
    this.isCheckIn = false,
    this.onCheckedIn,
  });

  Future<void> updateHotelCheckIn(String hotelId, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    final hotelsString = prefs.getString('hotels');

    if (hotelsString != null) {
      List<dynamic> hotels = jsonDecode(hotelsString);

      for (var hotel in hotels) {
        if (hotel['id'] == hotelId) {
          hotel['isCheckin'] = value;
          break;
        }
      }

      await prefs.setString('hotels', jsonEncode(hotels));
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.themeMode == ThemeMode.dark;
    final themeIcon = isDarkMode ? Icons.dark_mode : Icons.light_mode;

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
          CustomText(
            text: title,
            size: CustomTextSize.lg,
            fontWeight: FontWeight.w600,
            color: CustomTextColor.text,
            textAlign: TextAlign.center,
          ),
        ],
      ),

      actions: [
        if (isCheckIn)
          Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: CustomButton(
              text: "Check in",
              onPressed: () {
                CustomPopup.show(
                  context,
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(
                        text: "Are you sure to check in?",
                        size: CustomTextSize.lg,
                        fontWeight: FontWeight.bold,
                        color: CustomTextColor.text,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                Navigator.pop(context, true);
                                Navigator.of(context).pop();

                                final hotelId = hotelInfo?["hotelId"];
                                final hotelName = hotelInfo?["hotelName"];

                                if (hotelId != null) {
                                  await updateHotelCheckIn(hotelId, true);
                                }

                                if (onCheckedIn != null) {
                                  onCheckedIn!();
                                }

                                await CustomNavigation.push<bool>(
                                  context,
                                  HotelRoomsWithCheckIn(
                                    hotelId: hotelId,
                                    hotelName: hotelName,
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
        else ...[
          IconButton(
            icon: Icon(
              Icons.notifications,
              color:
                  isDarkMode ? AppColors.lightSurface : AppColors.darkSurface,
              size: 20.sp,
            ),
            onPressed: () {
              CustomNavigation.push(context, NotificationsScreen());
            },
          ),
          IconButton(
            icon: Icon(
              Icons.language,
              color:
                  isDarkMode ? AppColors.lightSurface : AppColors.darkSurface,
              size: 20.sp,
            ),
            onPressed: () {
              CustomPopup.show(
                context,
                content: LanguagePopupWidget(
                  languages: [
                    {'name': 'English', 'flag': '🇬🇧'},
                    {'name': 'Urdu', 'flag': '🇵🇰'},
                    {'name': 'Spanish', 'flag': '🇪🇸'},
                    {'name': 'French', 'flag': '🇫🇷'},
                    {'name': 'German', 'flag': '🇩🇪'},
                    {'name': 'Chinese', 'flag': '🇨🇳'},
                  ],
                  selectedLanguage: 'English',
                  onSelected: (lang) {},
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(
              themeIcon,
              color:
                  isDarkMode ? AppColors.lightSurface : AppColors.darkSurface,
              size: 20.sp,
            ),
            onPressed: () {
              themeProvider.toggleTheme(!isDarkMode);
            },
          ),
        ],
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight.h);
}
