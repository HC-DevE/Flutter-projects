import 'dart:ui';

import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        child: Stack(children: <Widget>[
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: const SizedBox(
              height: 60,
              width: 60,
            ),
          ),
          Positioned(
            child: Container(
              width: Dimensions.screenWidth * .5,
              height: Dimensions.screenHeight * .1,
              decoration: const BoxDecoration(
                color: Color(0xffc9b6d7),
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
              child: const Center(
                child: Text(
                  'Coming Soon...',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ]),
      )),
    );
  }
}
