import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DailyGoalForm extends StatefulWidget {
  const DailyGoalForm({super.key});

  @override
  DailyGoalFormState createState() => DailyGoalFormState();
}

class DailyGoalFormState extends State<DailyGoalForm> {
  int currentStep = 0;
  String? gender;
  double? weight;
  double? dailyGoal;
  String? unit;
  double? height;

  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    gender = "male";
    unit = "cl";
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void _saveFormValues() {
    _prefs.setString('gender', gender ?? '');
    _prefs.setDouble('weight', weight ?? 0.0);
    _prefs.setDouble('height', height ?? 0.0);
    _prefs.setDouble('dailyGoal', dailyGoal ?? 0.0);
    _prefs.setString('unit', unit ?? '');
  }

  // void _loadFormValues() {
  //   setState(() {
  //     gender = _prefs.getString('gender');
  //     weight = _prefs.getDouble('weight');
  //     height = _prefs.getDouble('height');
  //     dailyGoal = _prefs.getDouble('dailyGoal');
  //     unit = _prefs.getString('unit');
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    List<Step> formSteps = [
      Step(
        title: const Text('Informations personnelles'),
        content: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ToggleButtons(
                  isSelected: gender == 'male' || gender == null
                      ? [true, false]
                      : [false, true],
                  onPressed: (index) {
                    setState(() {
                      gender = index == 0 ? 'male' : 'female';
                      _saveFormValues();
                    });
                  },
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[400],
                  selectedColor: Colors.white,
                  fillColor: Theme.of(context).primaryColor,
                  selectedBorderColor: Theme.of(context).primaryColor,
                  children: const <Widget>[
                    Text('Homme'),
                    Text('Femme'),
                  ],
                ),
              ],
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Poids (en kg)'),
              onChanged: (value) {
                setState(() {
                  weight = double.tryParse(value);
                  _saveFormValues();
                });
              },
              initialValue: weight?.toStringAsFixed(2),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Taille (en cm)'),
              onChanged: (value) {
                setState(() {
                  height = double.tryParse(value);
                  _saveFormValues();
                });
              },
              initialValue: height?.toStringAsFixed(2),
            ),
          ],
        ),
        isActive: true,
      ),
      Step(
        title: const Text('Objectifs quotidiens'),
        content: Column(
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: 'Objectif quotidien'),
              onChanged: (value) {
                setState(() {
                  dailyGoal = double.parse(value);
                  _saveFormValues();
                });
              },
              initialValue: dailyGoal?.toStringAsFixed(2),
            ),
            DropdownButtonFormField(
              value: unit,
              items: const [
                DropdownMenuItem(value: 'oz', child: Text('oz')),
                DropdownMenuItem(value: 'cl', child: Text('cl')),
              ],
              onChanged: (value) {
                setState(() {
                  unit = value.toString();
                  _saveFormValues();
                  print('unit: $unit');
                });
              },
              decoration: const InputDecoration(labelText: 'Unité de mesure'),
            ),
          ],
        ),
        isActive: currentStep >= 1 ? true : false,
      ),
    ];
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Stepper(
            steps: formSteps,
            currentStep: currentStep,
            onStepTapped: (step) {
              setState(() {
                currentStep = step;
              });
            },
            onStepCancel: () {
              // print("STEP CANCEL, STEP: $currentStep");
              if (currentStep > 0) {
                // print("In if");
                setState(() {
                  currentStep--;
                });
              }
            },
            onStepContinue: () {
              // print("STEP CONTINUE, STEP: $currentStep");
              if (currentStep < formSteps.length - 1) {
                setState(() {
                  currentStep++;
                });
              } else {
                Navigator.of(context).pop({
                  'gender': gender,
                  'weight': weight,
                  'dailyGoal': dailyGoal,
                  'unit': unit,
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
