import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:watintake_dribble_design/components/my_text_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  //text editing controllers
  final emailController = TextEditingController();

  Future passwordReset() async {
    //try password reset
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text);

      // ignore: use_build_context_synchronously
      //showdialog must be rebased in a global widget (refactor)
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              'Success',
              style: TextStyle(
                color: Colors.green,
              ),
            ),
            content: const Text(
                'Password reset link has been sent to your email address'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Ok'))
            ],
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              'Error',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            content: Text(e.message!.toString()),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Ok'))
            ],
          );
        },
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Enter your email and we will send you a link to reset your password',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 20),
          MyTextField(
            controller: emailController,
            hintText: 'Email',
            isPassword: false,
          ),
          MaterialButton(
            onPressed: () => passwordReset(),
            color: Colors.blue,
            textColor: Colors.white,
            child: const Text('Reset Password'),
          )
        ],
      ),
    );
  }
}
