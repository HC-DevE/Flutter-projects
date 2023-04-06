import 'package:flutter/material.dart';

class DailyGoalForm extends StatefulWidget {
  const DailyGoalForm({Key? key});

  @override
  DailyGoalFormState createState() => DailyGoalFormState();
}

class DailyGoalFormState extends State<DailyGoalForm> {
  int currentStep = 0;
  String? gender;
  double? weight;
  double? dailyGoal;
  String? unit;

  @override
  void initState() {
    super.initState();
    gender = "male";
    unit = "oz";
  }

  @override
  Widget build(BuildContext context) {

    List<Step> formSteps = [
      Step(
        title: Text('Informations personnelles'),
        content: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SizedBox(
                  width: 200.0,
                  child: RadioListTile(
                    title: const Text('Homme'),
                    value: 'male',
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value as String?;
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 200.0,
                  child: RadioListTile(
                    title: const Text('Femme'),
                    value: 'female',
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value as String?;
                      });
                    },
                  ),
                ),
              ],
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Poids (en kg)'),
              onChanged: (value) {
                setState(() {
                  weight = double.tryParse(value);
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
                  print(
                      'dailyGoal: $dailyGoal'); // Ajoutez cette ligne pour vérifier la valeur
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
                  unit = value.toString();
                  print(
                      'unit: $unit'); // Ajoutez cette ligne pour vérifier la valeur
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
              print("STEP CANCEL, STEP: $currentStep");
              if (currentStep > 0) {
                print("In if");
                setState(() {
                  currentStep--;
                });
              }
            },
            onStepContinue: () {
              print("STEP CONTINUE, STEP: $currentStep");
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
