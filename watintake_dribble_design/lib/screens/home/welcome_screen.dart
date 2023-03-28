import 'package:flutter/material.dart';
import 'package:watintake_dribble_design/screens/home/homepage_screen.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 50),
            height: MediaQuery.of(context).size.width * 0.7,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color(0xffF2F2F2),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Image.asset(
              'lib/assets/images/welcome-screen-image.png',
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),
          Container(
            height: 150,
            width: 350,
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.width * 0.5,
            ),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                shadowColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => HomePageScreen(),
                  ),
                );
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xff70BDF2),
                ),
                child: Center(child: Text('Get Started')),
              ),
            ),
          ),
        ],
      ),
    );
  }

//   void _openMyPage() {
//     Navigator.push<void>(
//       context,
//       MaterialPageRoute<void>(
//         builder: (BuildContext context) => const MyPage(),
//       ),
//     );
//   }
}
