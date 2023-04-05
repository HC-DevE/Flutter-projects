import 'package:flutter/material.dart';


class WaterBottle extends StatelessWidget {
  final double? currentWater;
  final double? dailyGoal;

  const WaterBottle({Key? key, this.currentWater, this.dailyGoal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Bouteille d'eau vide
        Image.asset(
          "lib/assets/images/water_bottle.png",
          width: 200,
          height: 400,
        ),
        // Eau actuelle
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: (currentWater ?? 0) / (dailyGoal ?? 1) * 300,
            color: Colors.blue,
          ),
        ),
        // Ligne pourcentage
        Positioned(
          bottom: (dailyGoal ?? 1) / 100 * 300,
          left: 0,
          right: 0,
          child: Container(
            height: 2,
            color: Colors.black,
          ),
        ),
        // Texte pourcentage
        Positioned(
          bottom: (dailyGoal ?? 1) / 100 * 300 - 10,
          left: 0,
          right: 0,
          child: Text(
            '${(currentWater ?? 0) / (dailyGoal ?? 1) * 100}% objectif',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
