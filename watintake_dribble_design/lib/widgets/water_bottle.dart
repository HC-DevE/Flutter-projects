import 'package:flutter/material.dart';

class WaterBottle extends StatelessWidget {
  final double currentWater;
  final double dailyGoal;
  final String unit;

  const WaterBottle({super.key, required this.currentWater, required this.dailyGoal, required this.unit});

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
          const Text(
            'Current Water Intake',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: percentage,
            backgroundColor: Colors.white,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.lightBlueAccent),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${currentWater.toStringAsFixed(0)} $unit',
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                '${dailyGoal.toStringAsFixed(0)} $unit',
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
