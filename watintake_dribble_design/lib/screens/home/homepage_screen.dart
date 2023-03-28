import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 350,
          width: 500,
          decoration: BoxDecoration(
            color: Color(0xff70BDF2),
            borderRadius: BorderRadius.circular(22)
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
                child: Text('Title one')),
              Text('SubTitle one'),
              Text('Paragraph one')
            ],
          ),
        ),
      ),
    );
  }
}