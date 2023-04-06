import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:watintake_dribble_design/components/search_bar.dart';
import 'package:watintake_dribble_design/controllers/food_controller.dart';
import 'package:watintake_dribble_design/screens/home/search_bar_screen.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

void signUserOut() {
  GoogleSignIn().signOut();
  FirebaseAuth.instance.signOut();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // elevation: 0,
          // toolbarHeight: 0,
          backgroundColor: Colors.transparent,
          actions: const [
            IconButton(onPressed: signUserOut, icon: Icon(Icons.logout)),
          ],
        ),
        body: Container(
          child: Row(
            children: [
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
                    color: const Color(0xff70BDF2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Search for food',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff70BDF2),
                ),
              ),
            ],
          ),
        ));
  }
}


//homepage from Paul's branch

// @override
//   Widget build(BuildContext context) {
//     // ignore: prefer_const_constructors
//     return Scaffold(
//       body: const HomePageWidget(),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.business),
//             label: 'Workout',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.school),
//             label: 'Hydratation',
//           ),
//         ],
//         currentIndex: 0,
//         selectedItemColor: Colors.amber[800],
//         onTap: (int index) {
//           if (index == 0) {
//             Navigator.push<void>(
//               context,
//               MaterialPageRoute<void>(
//                 builder: (BuildContext context) => const HomePageScreen(),
//               ),
//             );
//           } else if (index == 1) {
//             Navigator.push<void>(
//               context,
//               MaterialPageRoute<void>(
//                 builder: (BuildContext context) => const WelcomePage(),
//               ),
//             );
//           } else if (index == 2) {
//             Navigator.push<void>(
//               context,
//               MaterialPageRoute<void>(
//                 builder: (BuildContext context) => const Placeholder(),
//               ),
//             );
//           }
//         },
//       )
    
//     );
//   }
// }

// class HomePageWidget extends StatelessWidget {
//   const HomePageWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(children: [
//         Card(
//           // clipBehavior is necessary because, without it, the InkWell's animation
//           // will extend beyond the rounded edges of the [Card] (see https://github.com/flutter/flutter/issues/109776)
//           // This comes with a small performance cost, and you should not set [clipBehavior]
//           // unless you need it.
//           clipBehavior: Clip.hardEdge,
//           child: InkWell(
//             splashColor: Colors.blue.withAlpha(30),
//             onTap: () {
//               Navigator.push<void>(
//                 context,
//                 MaterialPageRoute<void>(
//                   builder: (BuildContext context) => const HomePageScreen(),
//                 ),
//               );
//             },
//             child: const SizedBox(
//               width: 300,
//               height: 100,
//               child: Text('Workout Page'),
//             ),
//           ),
//         ),
//         Card(
//           // clipBehavior is necessary because, without it, the InkWell's animation
//           // will extend beyond the rounded edges of the [Card] (see https://github.com/flutter/flutter/issues/109776)
//           // This comes with a small performance cost, and you should not set [clipBehavior]
//           // unless you need it.
//           clipBehavior: Clip.hardEdge,
//           child: InkWell(
//             splashColor: Colors.blue.withAlpha(30),
//             onTap: () {
//               Navigator.push<void>(
//                 context,
//                 MaterialPageRoute<void>(
//                   builder: (BuildContext context) => const HydratationPage(),
//                 ),
//               );
//             },
//             child: const SizedBox(
//               width: 300,
//               height: 100,
//               child: Text('hydratation Page'),
//             ),
//           ),
//         ),
//       ]),
//     );
//   }
// }


