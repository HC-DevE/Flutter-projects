import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:watintake_dribble_design/screens/home/welcome_screen.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const WelcomePage(),
                    ),
                  );
                },
              ),
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.account_circle_rounded)),
            ],
          ),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.business),
      //       label: 'Hydration',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.school),
      //       label: 'Workout',
      //     ),
      //   ],
      //   selectedItemColor: Colors.amber[800],
      //   onTap: (_) {
      //     Navigator.push<void>(
      //       context,
      //       MaterialPageRoute<void>(
      //         builder: (BuildContext context) => const WelcomePage(),
      //       ),
      //     );
      //   },
      // ),
      body: SafeArea(
        child: Container(
          height: 350,
          width: 500,
          decoration: BoxDecoration(
              color: Color(0xff70BDF2),
              borderRadius: BorderRadius.circular(22)),
          child: Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text('Title one')),
              Text('SubTitle one'),
              Text('Paragraph one')
            ],
          ),
        ),
      ),
    );
  }
}
