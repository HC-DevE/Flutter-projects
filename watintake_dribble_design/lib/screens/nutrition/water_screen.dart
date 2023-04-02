import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';


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
         child: const Text('Open Dialog'),
          ),
          
      );
  }
}

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Basic dialog title'),
          content: const Text('A dialog is a type of modal window that\n'
              'appears in front of app content to\n'
              'provide critical information, or prompt\n'
              'for a decision to be made.'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Disable'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Enable'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }