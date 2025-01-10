import 'package:book_event/pages/booking_screen.dart';
import 'package:book_event/pages/home_screen.dart';
import 'package:book_event/pages/profile_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  late List<Widget> pages;
  late HomeScreen homeScreen;
  late BookingScreen bookingScreen;
  late ProfileScreen profileScreen;
  int currentTabIndex = 0;

  @override
  void initState() {
    homeScreen = HomeScreen();
    bookingScreen = BookingScreen();
    profileScreen = ProfileScreen();

    pages = [homeScreen, bookingScreen, profileScreen];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          height: 60,
          color: Colors.black,
          backgroundColor: Colors.white,
          animationDuration: Duration(milliseconds: 500),
          onTap: (int index) {
            setState(() {
              currentTabIndex = index;
            });
          },
          items: [
            Icon(
              Icons.home_outlined,
              color: Colors.white,
            ),
            Icon(
              Icons.book_online_outlined,
              color: Colors.white,
            ),
            Icon(
              Icons.person_outline,
              color: Colors.white,
            ),
          ]),
      body: pages[currentTabIndex],
    );
  }
}
