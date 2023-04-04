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
  late List<Common>? _commonFood = [];
  late List<Branded>? _brandedFood = [];

  @override
  void initState() {
    super.initState();
    // _getFoodData();
  }

  Future<void> _getFoodData() async {
    final value = await NutritionixService.fetchFood('apple');
    _commonFood = value.common;
    _brandedFood = value.branded;
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
                future: _getFoodData(),
                builder: (context, snapshot) {
                  return Column(
                    children: [
                      const Text('Common Food:'),
                      SizedBox(
                        height: 300,
                        child: ListView.builder(
                          itemCount: _commonFood!.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.only(left: 15, bottom: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 5,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: ListTile(
                                    onTap: () {},
                                    title: Text(
                                        _commonFood![index].foodName.toString()),
                                    leading: SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: Image.network(
                                        _commonFood![index]
                                            .photo!
                                            .thumb
                                            .toString(),
                                        loadingBuilder:
                                            (context, child, loadingProgress) {
                                          if (loadingProgress == null)
                                            return child;
                                          return CircularProgressIndicator();
                                        },
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: const Text('Branded Food:',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      SizedBox(
                        height: 300,
                        child: ListView.builder(
                          itemCount: _brandedFood!.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.only(left: 15, bottom: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 5,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: ListTile(
                                    onTap: () {},
                                    title: Text(
                                        _brandedFood![index].foodName.toString()),
                                    subtitle: Row(
                                      children: [
                                        Text(_brandedFood!
                                            .elementAt(index)
                                            .servingQty!
                                            .toString()),
                                        const SizedBox(width: 5),
                                        Text(_brandedFood!
                                            .elementAt(index)
                                            .servingUnit!
                                            .toString()),
                                      ],
                                    ),
                                    leading: SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: Image.network(
                                          _brandedFood!
                                              .elementAt(index)
                                              .photo!
                                              .thumb
                                              .toString(),
                                          loadingBuilder:
                                              (context, child, loadingProgress) {
                                        if (loadingProgress == null) return child;
                                        return CircularProgressIndicator();
                                      }, fit: BoxFit.contain),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
