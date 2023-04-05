// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:watintake_dribble_design/widgets/daily_goal_form.dart';

import '../../widgets/water_bottle.dart';

class HydratationPage extends StatefulWidget {
  const HydratationPage({Key? key});

  @override
  State<HydratationPage> createState() => _HydratationPageState();
}

class _HydratationPageState extends State<HydratationPage> {
  
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: const HydratationPageWidget(),
    );
    
  }
}

class HydratationPageWidget extends StatefulWidget {
  const HydratationPageWidget({Key? key});

  @override
  State<HydratationPageWidget> createState() => _HydratationPageWidgetState();
}
class _HydratationPageWidgetState extends State<HydratationPageWidget> {
  double? dailyGoal = null;
  double? currentWater = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (dailyGoal != null)
          WaterBottle(currentWater: currentWater, dailyGoal: dailyGoal!),
        ElevatedButton(
          onPressed: () => _dialogBuilder(context),
          child: const Text('Set your daily goal for water intake'),
        ),
      ],
    );
  }

  Future<void> _dialogBuilder(BuildContext context) async {
    final result = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (BuildContext context) {
        return DailyGoalForm();
      },
    );
    if (result != null) {
      setState(() {
        dailyGoal = result['dailyGoal'];
      });
    }
  }
}
