import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomBottomNavBar extends StatelessWidget {
  void Function(int index) onTabChange;
  CustomBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      padding: const EdgeInsets.only(bottom: 25),
      child: GNav(
        // backgroundColor: Colors.blue,
        // rippleColor: Colors.white,
        // hoverColor: Colors.blue.shade800,
        mainAxisAlignment: MainAxisAlignment.center,
        activeColor: Colors.white,
        color: Color(0xff70BDF2),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        duration: const Duration(milliseconds: 100),
        tabBackgroundColor: Colors.blue.shade200,
        tabActiveBorder: Border.all(color: const Color(0xff70BDF2)),
        gap: 8,
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.water_drop,
            text: 'Hydratation',
          ),
          GButton(
            icon: Icons.fitness_center,
            text: 'Workout',
            iconColor: Color(0xffc9b6d7),
            iconActiveColor: Color(0xfff6cadd),
          ),
          GButton(
            icon: Icons.settings,
            text: 'Settings',
            iconColor: Colors.black,
            iconActiveColor: Colors.black,
          )
        ],
        onTabChange: (value) => onTabChange(value),
      ),
    );
  }
}
