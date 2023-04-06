import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:watintake_dribble_design/screens/home/landing_page.dart';

import 'login_register_screen.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is logged in
          if (snapshot.hasData) {
            return const LandingPage();
          }
          //user not logged in
          else {
            return const LoginOrRegisterScreen();
          }
        },
      ),
    );
  }
}
