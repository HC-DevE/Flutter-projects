import 'package:flutter/material.dart';
import 'package:watintake_dribble_design/screens/home/register_screen.dart';

import 'login_screen.dart';

class LoginOrRegisterScreen extends StatefulWidget {
  const LoginOrRegisterScreen({super.key});

  @override
  State<LoginOrRegisterScreen> createState() => _LoginOrRegisterScreenState();
}

class _LoginOrRegisterScreenState extends State<LoginOrRegisterScreen> {
  //initially show login page
  bool showLoginPage = true;

  //toggle between login and register page
  void togglepages(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return LoginScreen(onTap: togglepages);
    } else {
      return  RegisterScreen(onTap: togglepages);
    }
  }
}
