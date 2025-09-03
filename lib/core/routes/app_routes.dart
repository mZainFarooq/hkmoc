import 'package:flutter/material.dart';
import 'package:flutter_app/features/screens/aboutApp/about_app.dart';
import 'package:flutter_app/features/screens/helpnsupport/help_and_support.dart';
import 'package:flutter_app/features/screens/history/history_screen.dart';
import 'package:flutter_app/features/screens/permissions/permissions_screen.dart';
import 'package:flutter_app/features/screens/profile/edit_profile.dart';
import 'package:flutter_app/features/screens/profile/profile_screen.dart';
import 'package:flutter_app/features/screens/salary/salary_screen.dart';
import 'package:flutter_app/features/screens/settings/settings_screen.dart';
import 'package:flutter_app/features/screens/sick/sick_screen.dart';
import 'package:flutter_app/features/screens/splash/splash_screen.dart';
import 'package:flutter_app/features/screens/termsNconditions/terms_and_conditions.dart';
import '../constants/app_route_names.dart';
import '../../features/screens/auth/login_screen.dart';
import '../../features/screens/dashboard/dashboard_screen.dart';
import '../../features/screens/notfications/notifcations_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    AppRouteNames.splash: (context) => SplashScreen(),
    AppRouteNames.login: (context) => const LoginScreen(),
    AppRouteNames.dashboard: (context) => const DashboardScreen(),
    AppRouteNames.history: (context) => const HistoryScreen(),
    AppRouteNames.settings: (context) => const SettingsScreen(),
    AppRouteNames.profile: (context) => const ProfileScreen(),
    AppRouteNames.notification: (context) => NotificationsScreen(),
    AppRouteNames.aboutApp: (context) => AboutAppScreen(),
    AppRouteNames.helpNsupport: (context) => HelpAndSupportScreen(),
    AppRouteNames.editProfile: (context) => EditProfileScreen(),
    AppRouteNames.sick: (context) => SickLeavePage(),
    AppRouteNames.termsNconditions: (context) => TermsAndConditionsPage(),
    AppRouteNames.permissions: (context) => PermissionsPage(),
    AppRouteNames.salary: (context) => SalaryScreen(),
  };
}
