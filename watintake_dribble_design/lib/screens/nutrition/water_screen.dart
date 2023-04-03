import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:watintake_dribble_design/widgets/daily_goal_form.dart';



class HydratationPage extends StatefulWidget {
  const HydratationPage({super.key});

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
  const HydratationPageWidget({super.key});

  @override
  State<HydratationPageWidget> createState() => _HydratationPageWidgetState();
}

class _HydratationPageWidgetState extends State<HydratationPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: 
        OutlinedButton(
         onPressed: () => _dialogBuilder(context),
         child: const Text('Set your daily goal for water intake'),
          ),
          
      );
  }
}

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Set your daily goal for water intake'),
          content: const Text('A dialog is a type of modal window that\n'
              'appears in front of app content to\n'
              'provide critical information, or prompt\n'
              'for a decision to be made.'),
          actions: <Widget>[
            DailyGoalForm()

          ],
        );
      },
    );
  }