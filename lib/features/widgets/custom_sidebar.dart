import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/app_assets.dart';
import 'package:flutter_app/core/utils/custom_navigation.dart';
import 'package:flutter_app/features/screens/aboutApp/about_app.dart';
import 'package:flutter_app/features/screens/auth/login_screen.dart';
import 'package:flutter_app/features/screens/permissions/permissions_screen.dart';
import 'package:flutter_app/features/screens/privacyPolicy/privacy_policy.dart';
import 'package:flutter_app/features/screens/profile/profile_screen.dart';
import 'package:flutter_app/features/screens/salary/salary_screen.dart';
import 'package:flutter_app/features/screens/termsNconditions/terms_and_conditions.dart';
import 'package:flutter_app/features/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../widgets/custom_text.dart';

class CustomSidebar extends StatefulWidget {
  final Widget child;
  const CustomSidebar({super.key, required this.child});

  @override
  CustomSidebarState createState() => CustomSidebarState();
}

class CustomSidebarState extends State<CustomSidebar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  bool _isSidebarOpen = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  void toggleSidebar() {
    setState(() {
      _isSidebarOpen = !_isSidebarOpen;
      if (_isSidebarOpen) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final backgroundColor =
        isDarkMode ? AppColors.darkSurface : AppColors.lightSurface;
    final textColor = isDarkMode ? AppColors.darkText : AppColors.lightText;
    final primaryColor =
        isDarkMode ? AppColors.darkPrimary : AppColors.lightPrimary;

    // Dummy user data
    String? userAvatarUrl =
        "https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8bW9kZWx8ZW58MHx8MHx8fDA%3D";
    String userName = "Charlotte Elizabeth";
    String email = "charlotteeliza@gmail.com";

    return Stack(
      children: [
        widget.child,
        if (_isSidebarOpen)
          GestureDetector(
            onTap: toggleSidebar,
            child: Container(color: Colors.black54),
          ),
        SlideTransition(
          position: _slideAnimation,
          child: SafeArea(
            child: Material(
              elevation: 8,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(24.r),
                bottomRight: Radius.circular(24.r),
              ),
              clipBehavior: Clip.antiAlias,
              child: Container(
                width: 250.w,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(24.r),
                    bottomRight: Radius.circular(24.r),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppSpacing.vlg,
                    // 🔹 Scrollable Menu Items
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSpacing.md.w,
                        ),
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 40.r,
                                  backgroundColor: primaryColor,
                                  backgroundImage:
                                      userAvatarUrl.isNotEmpty
                                          ? AssetImage(avatarImage)
                                          : null,
                                  child:
                                      userAvatarUrl.isEmpty
                                          ? Text(
                                            userName.isNotEmpty
                                                ? userName[0].toUpperCase()
                                                : "?",
                                            style: const TextStyle(
                                              fontSize: 28,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          )
                                          : null,
                                ),
                                AppSpacing.vmd,
                                CustomText(
                                  text: userName,
                                  size: CustomTextSize.lg,
                                  fontWeight: FontWeight.w700,
                                  color: CustomTextColor.text,
                                ),
                                AppSpacing.vxs,
                                CustomText(
                                  text: email,
                                  size: CustomTextSize.sm,
                                  fontWeight: FontWeight.w400,
                                  color: CustomTextColor.textSecondary,
                                ),
                              ],
                            ),
                            AppSpacing.vlg,
                            _buildSectionTitle("Account"),
                            _buildMenuItem(
                              icon: Icons.person,
                              label: "Profile",
                              color: textColor,
                              onTap: () {
                                toggleSidebar();
                                CustomNavigation.push(context, ProfileScreen());
                              },
                            ),
                            _buildMenuItem(
                              icon: Icons.account_balance_wallet,
                              label: "Salary",
                              color: textColor,
                              onTap: () {
                                toggleSidebar();
                                CustomNavigation.push(context, SalaryScreen());
                              },
                            ),
                            AppSpacing.vlg,
                            _buildSectionTitle("Information"),
                            _buildMenuItem(
                              icon: Icons.info,
                              label: "About App",
                              color: textColor,
                              onTap: () {
                                toggleSidebar();
                                CustomNavigation.push(
                                  context,
                                  AboutAppScreen(),
                                );
                              },
                            ),
                            _buildMenuItem(
                              icon: Icons.description,
                              label: "Terms and Conditions",
                              color: textColor,
                              onTap: () {
                                toggleSidebar();
                                CustomNavigation.push(
                                  context,
                                  TermsAndConditionsPage(),
                                );
                              },
                            ),
                            _buildMenuItem(
                              icon: Icons.lock,
                              label: "Privacy Policy",
                              color: textColor,
                              onTap: () {
                                toggleSidebar();
                                CustomNavigation.push(
                                  context,
                                  PrivacyPolicyPage(),
                                );
                              },
                            ),
                            _buildMenuItem(
                              icon: Icons.verified_user,
                              label: "Permissions",
                              color: textColor,
                              onTap: () {
                                toggleSidebar();
                                CustomNavigation.push(
                                  context,
                                  PermissionsPage(),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    // 🔹 Bottom Logout Button
                    Padding(
                      padding: EdgeInsets.all(AppSpacing.md.w),
                      child: SizedBox(
                        width: double.infinity,
                        child: CustomButton(
                          text: "Logout",
                          onPressed: () {
                            CustomNavigation.push(context, LoginScreen());
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return CustomText(
      text: title,
      size: CustomTextSize.lg,
      fontWeight: FontWeight.w600,
      color: CustomTextColor.text,
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: AppSpacing.md.h),
        child: Row(
          children: [
            Icon(icon, color: color, size: 24.sp),
            AppSpacing.hsm,
            CustomText(
              text: label,
              size: CustomTextSize.md,
              fontWeight: FontWeight.w500,
              color: CustomTextColor.text,
            ),
          ],
        ),
      ),
    );
  }
}
