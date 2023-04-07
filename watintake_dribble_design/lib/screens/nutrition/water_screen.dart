import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:watintake_dribble_design/widgets/daily_goal_form.dart';

import '../../widgets/water_bottle.dart';

class HydratationPage extends StatefulWidget {
  const HydratationPage({super.key});

  @override
  State<HydratationPage> createState() => _HydratationPageState();
}

class _HydratationPageState extends State<HydratationPage> {
  double? dailyGoal;
  double? currentWater = 0;
  String? unit;

  void _loadDailyGoal() async {
    final prefs = await SharedPreferences.getInstance();
    final dailyGoal = prefs.getDouble('dailyGoal');
    if (dailyGoal != null) {
      setState(() {
        this.dailyGoal = dailyGoal;
      });
    }
  }

  void _loadunit() async {
    final prefs = await SharedPreferences.getInstance();
    final unit = prefs.getString('unit');
    if (unit != null) {
      setState(() {
        this.unit = unit;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // _loadDailyGoal();
    // _loadunit();
  }


@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (dailyGoal != null)
            Expanded(
              child: WaterBottle(
                  currentWater: currentWater!, dailyGoal: dailyGoal!),
            ),
          if (dailyGoal == null)
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Set your daily goal for water intake',
                          style: TextStyle(
                            fontSize: 24, 
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () => _dialogBuilder(context),
                          child: const Text('Set Daily Goal'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          const SizedBox(height: 16),
          if (dailyGoal != null)
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Current Water intake',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '${currentWater?.toStringAsFixed(1) ?? '0'} $unit',
                        style: const TextStyle(
                            fontSize: 36, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () => _showAddWaterDialog(context),
                            child: const Text('Add Water'),
                          ),
                          ElevatedButton(
                            onPressed: () => _showAddOtherDialog(context),
                            child: const Text('Add Other'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    ),
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
        unit = result['unit'];
      });
    }
  }

Future<void> _showAddWaterDialog(BuildContext context) async {
  double? amount = currentWater;
  final result = await showDialog<Map<String, dynamic>>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Add Water'),
        content: TextField(
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          decoration: const InputDecoration(
            hintText: 'Enter amount ',
            labelText: 'Amount',
          ),
          onChanged: (value) {
            amount = double.tryParse(value);
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                currentWater = currentWater! + amount!;
              });
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
        ],
      );
    },
  );
}
  Future<void> _showAddOtherDialog(BuildContext context) async {
    double? amount = currentWater;
    final result = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Other'),
          content: TextField(
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
              hintText: 'Enter amount in ounces',
              labelText: 'Amount',
            ),
            onChanged: (value) {
              amount = double.tryParse(value);
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  currentWater = amount;
                });
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}


