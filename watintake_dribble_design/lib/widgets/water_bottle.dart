import 'package:flutter/material.dart';

class WaterBottle extends StatelessWidget {
  final double currentWater;
  final double dailyGoal;

  const WaterBottle({required this.currentWater, required this.dailyGoal});

  @override
  Widget build(BuildContext context) {
    final percentage = (currentWater / dailyGoal).clamp(0.0, 1.0);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Current Water Intake',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 8),
          LinearProgressIndicator(
            value: percentage,
            backgroundColor: Colors.white,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.lightBlueAccent),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${currentWater.toStringAsFixed(0)} ml',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                '${dailyGoal.toStringAsFixed(0)} ml',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
