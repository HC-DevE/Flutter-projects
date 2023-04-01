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
    // ignore: prefer_const_constructors
    return Scaffold(
      body: const HomePageWidget(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Workout',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Hydratation',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.amber[800],
        onTap: (int index) {
          if (index == 0) {
            Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const HomePageScreen(),
              ),
            );
          } else if (index == 1) {
            Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const WelcomePage(),
              ),
            );
          } else if (index == 2) {
            Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const Placeholder(),
              ),
            );
          }
        },
      )
    
    );
  }
}

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Card(
          // clipBehavior is necessary because, without it, the InkWell's animation
          // will extend beyond the rounded edges of the [Card] (see https://github.com/flutter/flutter/issues/109776)
          // This comes with a small performance cost, and you should not set [clipBehavior]
          // unless you need it.
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const HomePageScreen(),
                ),
              );
            },
            child: const SizedBox(
              width: 300,
              height: 100,
              child: Text('Workout Page'),
            ),
          ),
        ),
        Card(
          // clipBehavior is necessary because, without it, the InkWell's animation
          // will extend beyond the rounded edges of the [Card] (see https://github.com/flutter/flutter/issues/109776)
          // This comes with a small performance cost, and you should not set [clipBehavior]
          // unless you need it.
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const HomePageScreen(),
                ),
              );
            },
            child: const SizedBox(
              width: 300,
              height: 100,
              child: Text('hydratation Page'),
            ),
          ),
        ),
      ]),
    );
  }
}


