import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:watintake_dribble_design/widgets/daily_goal_form.dart';

import '../../widgets/water_bottle.dart';

class HydratationPage extends StatefulWidget {
  const HydratationPage({Key? key}) : super(key: key);

  @override
  State<HydratationPage> createState() => _HydratationPageState();
}

class _HydratationPageState extends State<HydratationPage> {
  double? dailyGoal;
  double? currentWater = 0;
  String? unit;

  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _initPrefs();
    _loadDailyGoal();
    _loadUnit();
    _loadCurrentWater();
  }

  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void _saveCurrentWaterValue() {
    _prefs.setDouble('currentWater', currentWater ?? 0.0);
  }

  void _loadDailyGoal() async {
    final prefs = await SharedPreferences.getInstance();
    final dailyGoal = prefs.getDouble('dailyGoal');
    if (dailyGoal != null) {
      setState(() {
        this.dailyGoal = dailyGoal;
      });
    }
  }

  void _loadUnit() async {
    final prefs = await SharedPreferences.getInstance();
    final unit = prefs.getString('unit');
    if (unit != null) {
      setState(() {
        this.unit = unit;
      });
    }
  }

  void _loadCurrentWater() async {
    final prefs = await SharedPreferences.getInstance();
    final currentWater = prefs.getDouble('currentWater');
    if (currentWater != null) {
      setState(() {
        this.currentWater = currentWater;
      });
    }
  }

  void _resetCurrentWater() {
    setState(() {
      currentWater = 0;
      _saveCurrentWaterValue();
    });
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
                  currentWater: currentWater!,
                  dailyGoal: dailyGoal!,
                  unit: unit!,
                ),
              ),
            if (dailyGoal == null)
              Container(
                margin: const EdgeInsets.only(top: 40),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Set your Daily Goal for water intake',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 50),
                        ElevatedButton(
                            onPressed: () => _dialogBuilder(context),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: const Color(0xff70BDF2),
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                            child: const Text('Set Daily Goal')),
                      ],
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
                          'Your progression',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '${currentWater?.toStringAsFixed(1) ?? '0'} $unit',
                          style: const TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () => _showAddWaterDialog(context),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: const Color(0xff70BDF2),
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                              ),
                              child: const Text('Add Water'),
                            ),
                            //Coming soon
                            // ElevatedButton(
                            //   onPressed: () => _showAddOtherDialog(context),
                            //   child: const Text('Add Other Drinks'),
                            // ),
                            ElevatedButton(
                              onPressed: () => _resetCurrentWater(),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: const Color(0xff70BDF2),
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                              ),
                              child: const Text('Reset'),
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
        return const DailyGoalForm();
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

    await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Water'),
          content: TextField(
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
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
                  _saveCurrentWaterValue();
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
    await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Other'),
          content: TextField(
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
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
                  _saveCurrentWaterValue();
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
