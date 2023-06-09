import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watintake_dribble_design/firebase_options.dart';
import 'package:watintake_dribble_design/screens/home/homepage_screen.dart';
import 'package:watintake_dribble_design/screens/home/welcome_screen.dart';
import 'package:watintake_dribble_design/screens/nutrition/branded_food_detail_screen.dart';
import 'package:watintake_dribble_design/screens/nutrition/common_food_detail_screen.dart';

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
    return GetMaterialApp(
      //add routes for the app for each screen
      title: 'HydrateX',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const HomePageScreen()),
        GetPage(name: '/detailCommon', page: () => const CommonFoodDetailScreen()),
        GetPage(name: '/detailBranded', page: () => BrandedFoodDetailScreen()),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const WelcomePage(),
    );
  }
}
