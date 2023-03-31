import 'package:flutter/material.dart';
import 'package:watintake_dribble_design/screens/home/homepage_screen.dart';
import 'package:watintake_dribble_design/screens/home/login_screen.dart';
import 'package:watintake_dribble_design/screens/home/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: WelcomePage(),
      // home: LoginScreen(),
    );
  }
}
