import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:watintake_dribble_design/firebase_options.dart';
import 'package:watintake_dribble_design/screens/home/welcome_screen.dart';
import 'package:watintake_dribble_design/screens/nutrition/food_detail_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //add routes for the app for each screen
      title: 'HydrateX',
      routes: {
        // '/': (context) => const WelcomePage(),
        // '/home': (context) => const WelcomePage(),
        '/detail': (context) => const FoodDetailScreen(food: null,),
      },
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
      // home: SearchBar(),
    );
  }
}
