import 'package:flutter/material.dart';

class DailyGoalForm extends StatefulWidget {
  const DailyGoalForm({super.key});

  @override
  DailyGoalFormState createState() => DailyGoalFormState();
}

class DailyGoalFormState extends State<DailyGoalForm> {
  @override
  Widget build(BuildContext context) {
    int currentStep = 0;
    String? gender;
    double? weight;
    double? dailyGoal;
    String? unit;

    List<Step> formSteps = [
      Step(
        title: Text('Informations personnelles'),
        content: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Radio(
                  value: 'male',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                    });
                  },
                ),
                Text('Homme'),
                Radio(
                  value: 'female',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                    });
                  },
                ),
                Text('Femme'),
              ],
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Poids (en kg)'),
              onChanged: (value) {
                setState(() {
                  weight = double.parse(value);
                });
              },
            ),
          ],
        ),
        isActive: true,
      ),
      Step(
        title: Text('Objectifs quotidiens'),
        content: Column(
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Objectif quotidien'),
              onChanged: (value) {
                setState(() {
                  dailyGoal = double.parse(value);
                });
              },
            ),
            DropdownButtonFormField(
              value: unit,
              items: [
                DropdownMenuItem(value: 'oz', child: Text('oz')),
                DropdownMenuItem(value: 'cl', child: Text('centilitres')),
              ],
              onChanged: (value) {
                setState(() {
                  unit = value;
                });
              },
              decoration: InputDecoration(labelText: 'Unité de mesure'),
            ),
          ],
        ),
        isActive: true,
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
              if (currentStep > 0) {
                setState(() {
                  currentStep--;
                });
              }
            },
            onStepContinue: () {
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
