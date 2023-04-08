import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watintake_dribble_design/components/my_button.dart';
import 'package:watintake_dribble_design/components/my_text_field.dart';
import 'package:watintake_dribble_design/components/square_box_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:watintake_dribble_design/screens/home/reset_password_screen.dart';
import 'package:watintake_dribble_design/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  final Function()? onTap;
  const LoginScreen({super.key, this.onTap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() async {
    //show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    // try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      //close loading circle
      Navigator.pop(context);

      //show snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text('Login Successful'),
          duration: Duration(seconds: 1),
        ),
      );
    } on FirebaseAuthException catch (e) {
      //close loading circle
      Navigator.pop(context);

      //show snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(e.message!),
          duration: const Duration(seconds: 1),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                //logo
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Padding(
                padding: const EdgeInsets.only(bottom: 28.0),
                child: Image.asset(
                  'lib/assets/images/logo.png',
                  height: 100,
                ),
                  ),
                ),
                const SizedBox(height: 25),
                //First Text
                Text(
                  'Login',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 32,
                  ),
                ),
                const SizedBox(height: 10),
                //Second Text
                const Text(
                  'Hello again, please login to your account',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 30),
                //email textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  isPassword: false,
                ),
                const SizedBox(height: 10),

                //password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  isPassword: true,
                ),
                const SizedBox(height: 10),

                //forgot password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          //forgot password
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const ResetPasswordScreen();
                              },
                            ),
                          );
                        },
                        child: Text(
                          'Forgot Password ?',
                          style:
                              TextStyle(color: Colors.grey[600], fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                //login button
                MyButton(
                  text: 'Sign In',
                  onPressed: signUserIn,
                ),
                const SizedBox(height: 25),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey[400],
                          thickness: 0.5,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.grey[400],
                          thickness: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                //google + apple + other sign up buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareButton(
                      imagePath: 'lib/assets/images/google_icon_96.png',
                      onTap: AuthService().signInWithGoogle,
                    ),
                    const SizedBox(width: 10),
                    SquareButton(
                      imagePath: 'lib/assets/images/welcome_screen.png',
                      onTap: () {},
                    ),
                  ],
                ),

                const SizedBox(height: 35),

                //register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Not a member ?',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        '  Register Now ',
                        style: TextStyle(color: Colors.blue, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
