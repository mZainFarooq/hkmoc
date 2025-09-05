import 'package:flutter/material.dart';
import 'package:flutter_app/features/widgets/floating_timer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../features/widgets/custom_app_bar.dart';
import '../features/widgets/custom_bottom_navigation_bar.dart';
import '../features/widgets/custom_sidebar.dart';
import '../core/constants/app_route_names.dart';

class MainLayout extends StatefulWidget {
  final Widget body;
  final String title;
  final int currentIndex;
  final bool showBottomNav;
  final bool isBackAction;
  final bool isNotficationIcon;
  final bool isAvatarShow;
  final Map<String, dynamic>? user;
  final bool isSidebarEnabled;
  final bool isActionsShow;
  final bool isCheckIn;
  final VoidCallback? onCheckedIn;
  final Map<String, dynamic>? hotelInfo;

  const MainLayout({
    super.key,
    required this.body,
    required this.title,
    required this.currentIndex,
    this.showBottomNav = true,
    this.isBackAction = false,
    this.isAvatarShow = true,
    this.isActionsShow = true,
    this.user,
    this.isCheckIn = false,
    this.isSidebarEnabled = false,
    this.isNotficationIcon = true,
    this.hotelInfo,
    this.onCheckedIn,
  });

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final GlobalKey<CustomSidebarState> _sidebarKey = GlobalKey();
  bool showFloatingTimer = false;

  void _handleNavTap(int index) {
    String routeName;
    switch (index) {
      case 0:
        routeName = AppRouteNames.dashboard;
        break;
      case 1:
        routeName = AppRouteNames.history;
        break;
      case 2:
        routeName = AppRouteNames.settings;
        break;
      default:
        routeName = AppRouteNames.dashboard;
    }
    if (ModalRoute.of(context)?.settings.name != routeName) {
      Navigator.pushNamed(context, routeName);
    }
  }

  @override
  void initState() {
    super.initState();
    _loadFloatingTimerPreference();
  }

  void _toggleSidebar() {
    _sidebarKey.currentState?.toggleSidebar();
  }

  Future<void> _loadFloatingTimerPreference() async {
    final prefs = await SharedPreferences.getInstance();
    final hasCheckedIn = prefs.getBool('hasCheckedIn') ?? false;
    setState(() {
      showFloatingTimer = hasCheckedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold(
      appBar: CustomAppBar(
        title: widget.title,
        isNotficationIcon: widget.isNotficationIcon,
        isBackAction: widget.isBackAction,
        hotelInfo: widget.hotelInfo,
        isSidebarEnabled: widget.isSidebarEnabled,
        isUser: true,
        isActionsShow: widget.isActionsShow,
        isAvatarShow: widget.isAvatarShow,
        user: widget.user,
        isCheckIn: widget.isCheckIn,
        onMenuPressed: _toggleSidebar,
      ),
      body: Stack(
        children: [widget.body, if (showFloatingTimer) FloatingTimerWidget()],
      ),
      bottomNavigationBar:
          widget.showBottomNav
              ? CustomBottomNavigationBar(
                currentIndex: widget.currentIndex,
                onTap: _handleNavTap,
              )
              : null,
    );

    return widget.isSidebarEnabled
        ? CustomSidebar(key: _sidebarKey, child: scaffold)
        : scaffold;
  }
}
