import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:watintake_dribble_design/models/instant_search_api_data.dart';
import 'package:watintake_dribble_design/services/nutritionix_api_service.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

void signUserOut() {
  // AuthService().signOutFromGoogle();
  GoogleSignIn().signOut();
  FirebaseAuth.instance.signOut();
}

// Future getQueryResponseData() async {
//   var value = await NutritionixService.fetchFood('apple');
// }

class _HomePageScreenState extends State<HomePageScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  late List<Common>? _queryModel = [];

  _getData() async {
    print('QueryModel: $_queryModel');
    return _queryModel = await NutritionixService.fetchFood('apple');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: const [
            IconButton(onPressed: signUserOut, icon: Icon(Icons.logout)),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(user.displayName!),
                  Text(user.email!),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: FutureBuilder(
                  future: _getData(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                      itemCount: _queryModel!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_queryModel![index].foodName.toString()),
                          subtitle:
                              Text(_queryModel![index].servingQty!.toString()),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
