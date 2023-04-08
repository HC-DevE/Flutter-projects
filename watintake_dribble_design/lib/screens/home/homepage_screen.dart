import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:watintake_dribble_design/screens/home/search_bar_screen.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final user = FirebaseAuth.instance.currentUser;
  double? dailyGoal = 0;
  double? currentWater = 0;

  @override
  void initState() {
    super.initState();
    _initPrefs();
    _loadCurrentWater();
    _loadDailyGoal();
  }

  Future<void> _initPrefs() async {
  }

  void _loadDailyGoal() async {
    final prefs = await SharedPreferences.getInstance();
    final dailyGoal = prefs.getDouble('dailyGoal');
    if (dailyGoal != null) {
      setState(() {
        this.dailyGoal = dailyGoal;
      });
    }
  }

  void _loadCurrentWater() async {
    final prefs = await SharedPreferences.getInstance();
    final currentWater = prefs.getDouble('currentWater');
    if (currentWater != null) {
      setState(() {
        this.currentWater = currentWater;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Hello again!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              Text(
                "${user?.displayName ?? 'You'},",
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff70BDF2),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SearchBarScreen(),
              ),
            );
          },
          child: Container(
            height: 60,
            width: 300,
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xffc9b6d7),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(height: 10),
                const Text(
                  'Search for food ?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchBarScreen(),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                      color: const Color(0xfff6cadd),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Center(
          child: Container(
            height: 150,
            width: 250,
            margin: const EdgeInsets.only(top: 20, right: 120),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xff70BDF2),
              borderRadius: BorderRadius.circular(10),
              // image: DecorationImage(
              //   image: Image.asset('lib/assets/images/water_bg.jpg').image,
              // ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text(
                      'Your current intake',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      currentWater.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // const Text(
                //   'Calories',
                //   style: TextStyle(
                //     fontSize: 20,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.white,
                //   ),
                // ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
