import 'package:flutter/material.dart';
import 'auth_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          height: size.height * 0.9,
          child: Column(
            children: [
              Image.asset(
                'lib/assets/images/welcome_screen.png',
              ),
              const Text(
                "Your body needs water !",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff70BDF2),
                ),
              ),
              const SizedBox(height: 5),
              const SizedBox(
                width: 280,
                child: Text(
                  "Track your daily water intake with just a few taps !",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.black38,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(),
              Container(
                alignment: Alignment.bottomCenter,
                height: 45,
                width: 300,
                decoration: BoxDecoration(
                  color: const Color(0xff70BDF2),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push<void>(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => const AuthPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "Get Started",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Icon(Icons.arrow_forward, color: Colors.white),
                  ],
                ),
              )
            ],
          ),
        ),
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
