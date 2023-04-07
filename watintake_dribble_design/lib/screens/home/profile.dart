import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static void signUserOut() {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Profile',
            style: TextStyle(
              color: Color(0xff70BDF2),
            ),
            textAlign: TextAlign.center),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Color(0xff70BDF2),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/editProfile');
            },
            icon: const Icon(Icons.edit_outlined),
          ),
          IconButton(
            onPressed: () {
              signUserOut();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 50,
                  backgroundImage:
                      AssetImage('lib/assets/images/profile_icon.png'),
                ),
                const SizedBox(height: 16),
                const Text(
                  'John Doe',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'john.doe@example.com',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Personal Information',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Age: 30',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Gender: Male',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Height: 180 cm',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Weight: 80 kg',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
