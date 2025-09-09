import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/custom_navigation.dart';
import 'package:flutter_app/features/screens/dashboard/hotel_rooms_checkin_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FloatingTimerWidget extends StatefulWidget {
  const FloatingTimerWidget({super.key});

  @override
  _FloatingTimerWidgetState createState() => _FloatingTimerWidgetState();
}

class _FloatingTimerWidgetState extends State<FloatingTimerWidget> {
  late double top;
  late double left;
  int seconds = 0;
  Timer? timer;
  bool initialized = false;

  @override
  void initState() {
    super.initState();
    _initializeTimer();
  }

  Future<void> _initializeTimer() async {
    final prefs = await SharedPreferences.getInstance();
    final int? checkInTime = prefs.getInt('checkInTime');

    if (checkInTime != null) {
      final int elapsedSeconds =
          ((DateTime.now().millisecondsSinceEpoch - checkInTime) ~/ 1000);
      seconds = elapsedSeconds;
    }

    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        seconds++;
      });
    });

    setState(() {});
  }

  Future<void> _navigateToCheckedInHotel() async {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    if (currentRoute == "HotelRoomsWithCheckIn") {
      return; // already on this screen
    }

    final prefs = await SharedPreferences.getInstance();
    final String? checkedInHotelId = prefs.getString('checkedInHotelId');
    final String? hotelsString = prefs.getString('hotels');

    if (checkedInHotelId != null && hotelsString != null) {
      List<dynamic> hotelsList = jsonDecode(hotelsString);
      final hotel = hotelsList.firstWhere(
        (h) => h['id'] == checkedInHotelId,
        orElse: () => null,
      );

      if (hotel != null) {
        final hotelName = hotel['name'];
        CustomNavigation.push(
          context,
          HotelRoomsWithCheckIn(
            hotelId: checkedInHotelId,
            hotelName: hotelName,
          ),
          settings: const RouteSettings(name: "HotelRoomsWithCheckIn"),
        );
        return;
      }
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (!initialized) {
      left = size.width - 70 - 30;
      top = size.height - 70 - 150;
      initialized = true;
    }

    return Stack(
      children: [
        Positioned(
          top: top,
          left: left,
          child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                top += details.delta.dy;
                left += details.delta.dx;

                top = top.clamp(0.0, size.height - 70 - 100);
                left = left.clamp(0.0, size.width - 70);
              });
            },
            onTap: _navigateToCheckedInHotel,
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [Color(0xFFFFA726), Color(0xFFFF7043)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(2, 4),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Text(
                formatTime(seconds),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontFamily: 'RobotoMono',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  String formatTime(int seconds) {
    int min = seconds ~/ 60;
    int sec = seconds % 60;
    return '${min.toString().padLeft(2, '0')}:${sec.toString().padLeft(2, '0')}';
  }
}
