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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'lib/assets/images/menu_icon.png',
                        height: 30,
                        color: Color(0xff70BDF2),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => ProfilePage());
                        },
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.transparent,
                          child: SizedBox(
                            height: 45,
                            width: 45,
                            child: ClipOval(
                              child: Image.network(
                                user?.photoURL.toString() ?? 'You',
                              ),
                            ),
                          ),
                        ),
                        // child: Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Image.network(
                        //     user?.photoURL.toString() ?? 'You',
                        //     // height: 45,
                        //     fit: BoxFit.contain,
                        //   ),
                        // ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .7,
                  child: _pages[_selectedIndex],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomNavBar(
          onTabChange: (index) => navigateBottomBar(index),
        ));
  }
}
