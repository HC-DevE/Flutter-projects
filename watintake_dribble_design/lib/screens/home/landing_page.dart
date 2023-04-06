import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:watintake_dribble_design/screens/home/homepage_screen.dart';
import 'package:watintake_dribble_design/screens/home/profile.dart';

import '../../components/custom_navbar.dart';
import '../nutrition/water_screen.dart';
import '../workout/workout_screen.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

void signUserOut() {
  GoogleSignIn().signOut();
  FirebaseAuth.instance.signOut();
}

class _LandingPageState extends State<LandingPage> {
  final user = FirebaseAuth.instance.currentUser;
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const HomePageScreen(),
    const HydratationPage(),
    const WorkoutScreen(),
    // const SettingsPage(),
    const ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   toolbarHeight: 0,
        //   backgroundColor: Colors.transparent,
        //   actions: const [
        //     IconButton(onPressed: signUserOut, icon: Icon(Icons.logout)),
        //   ],
        // ),
        body: SafeArea(
          child: _pages[_selectedIndex],
        ),
        bottomNavigationBar: CustomBottomNavBar(
          onTabChange: (index) => navigateBottomBar(index),
        ));
  }
}
