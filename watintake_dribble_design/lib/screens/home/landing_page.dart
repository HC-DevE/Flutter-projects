import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:watintake_dribble_design/screens/home/homepage_screen.dart';
import 'package:watintake_dribble_design/screens/home/profile.dart';
import 'package:watintake_dribble_design/screens/home/settings.dart';

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
    const SettingsPage(),
    // const ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.blue[100],
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Hi, ${user?.displayName}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff70BDF2),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => ProfilePage());
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: const Color(0xff70BDF2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.account_circle_sharp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: MediaQuery.of(context).size.height * .7,
                child: _pages[_selectedIndex],
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomNavBar(
          onTabChange: (index) => navigateBottomBar(index),
        ));
  }
}
