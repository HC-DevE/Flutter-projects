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
      body: Column(
        // ignore: sort_child_properties_last
        children:const <Widget>[
          Spacer(),
          ElevatedCard(
            child: Placeholder(),
          ),
        ],
      
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Hydration',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Workout',
            ),
          ],
          selectedItemColor: Colors.amber[800],
          onTap: (_) {
            Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const WelcomePage(),
              ),
            );
          },
        );
      ),
    );

  }
}

class ElevatedCard extends StatelessWidget {
  const ElevatedCard({super.key, required Placeholder child});
  
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Card(
        child: SizedBox(
          width: 300,
          height: 100,
          child: Center(child: Text('Elevated Card')),
        )
      ),
    );
  }
}

