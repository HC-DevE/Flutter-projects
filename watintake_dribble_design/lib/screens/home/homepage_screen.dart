import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:watintake_dribble_design/components/search_bar.dart';
import 'package:watintake_dribble_design/controllers/food_controller.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

void signUserOut() {
  GoogleSignIn().signOut();
  FirebaseAuth.instance.signOut();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final user = FirebaseAuth.instance.currentUser;
  final FoodController _foodController = Get.put(FoodController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // toolbarHeight: 0,
        backgroundColor: Colors.transparent,
        actions: const [
          IconButton(onPressed: signUserOut, icon: Icon(Icons.logout)),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                child: SearchBar(),
              ),
              // const SizedBox(height: 10),
              Expanded(
                child: Obx(() {
                  if (_foodController.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    if (_foodController.foods.value.common!.isNotEmpty &&
                        _foodController.foods.value.branded!.isNotEmpty) {
                      return Column(
                        children: [
                          const Text('Common foods'),
                          Expanded(
                            child: ListView.builder(
                              itemCount:
                                  _foodController.foods.value.common!.length,
                              itemBuilder: (context, index) {
                                final commonfood =
                                    _foodController.foods.value.common![index];
                                return ListTile(
                                  title: Text(commonfood.foodName.toString()),
                                  leading: Image.network(
                                    commonfood.photo!.thumb.toString(),
                                    width: 50,
                                    height: 50,
                                  ),
                                  onTap: () {
                                    // Navigate to detail screen
                                    // Get.toNamed('/detail', arguments:{ 'foods': _foodController.foods.value, 'selectedIndex': index});
                                    Get.toNamed('/detail',
                                        arguments: commonfood);
                                    // Navigator.pushNamed(context, '/detail');
                                  },
                                );
                              },
                            ),
                          ),
                          const Divider(),
                          const Text('Branded foods'),
                          Expanded(
                            child: ListView.builder(
                              itemCount:
                                  _foodController.foods.value.branded!.length,
                              itemBuilder: (context, index) {
                                final brandedfood =
                                    _foodController.foods.value.branded![index];
                                return ListTile(
                                  title: Text(brandedfood.foodName.toString()),
                                  leading: Image.network(
                                    brandedfood.photo!.thumb.toString(),
                                    width: 50,
                                    height: 50,
                                  ),
                                  onTap: () {
                                    // Navigate to detail screen
                                    // Get.toNamed('/detail', arguments:{ 'foods': _foodController.foods.value, 'selectedIndex': index});
                                    Get.toNamed('/detail',
                                        arguments: brandedfood);
                                    // Navigator.pushNamed(context, '/detail');
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    } else {
                      if (_foodController.foods.value.common!.isEmpty &&
                          _foodController.foods.value.branded!.isEmpty) {
                        return const Center(child: Text('No data found'));
                          } else {
                            return const Center(child: Text('No data found'));
                          }
                      // return const Center(child: Text('No data found'));
                    }
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


//homepage from Paul's branch

// @override
//   Widget build(BuildContext context) {
//     // ignore: prefer_const_constructors
//     return Scaffold(
//       body: const HomePageWidget(),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.business),
//             label: 'Workout',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.school),
//             label: 'Hydratation',
//           ),
//         ],
//         currentIndex: 0,
//         selectedItemColor: Colors.amber[800],
//         onTap: (int index) {
//           if (index == 0) {
//             Navigator.push<void>(
//               context,
//               MaterialPageRoute<void>(
//                 builder: (BuildContext context) => const HomePageScreen(),
//               ),
//             );
//           } else if (index == 1) {
//             Navigator.push<void>(
//               context,
//               MaterialPageRoute<void>(
//                 builder: (BuildContext context) => const WelcomePage(),
//               ),
//             );
//           } else if (index == 2) {
//             Navigator.push<void>(
//               context,
//               MaterialPageRoute<void>(
//                 builder: (BuildContext context) => const Placeholder(),
//               ),
//             );
//           }
//         },
//       )
    
//     );
//   }
// }

// class HomePageWidget extends StatelessWidget {
//   const HomePageWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(children: [
//         Card(
//           // clipBehavior is necessary because, without it, the InkWell's animation
//           // will extend beyond the rounded edges of the [Card] (see https://github.com/flutter/flutter/issues/109776)
//           // This comes with a small performance cost, and you should not set [clipBehavior]
//           // unless you need it.
//           clipBehavior: Clip.hardEdge,
//           child: InkWell(
//             splashColor: Colors.blue.withAlpha(30),
//             onTap: () {
//               Navigator.push<void>(
//                 context,
//                 MaterialPageRoute<void>(
//                   builder: (BuildContext context) => const HomePageScreen(),
//                 ),
//               );
//             },
//             child: const SizedBox(
//               width: 300,
//               height: 100,
//               child: Text('Workout Page'),
//             ),
//           ),
//         ),
//         Card(
//           // clipBehavior is necessary because, without it, the InkWell's animation
//           // will extend beyond the rounded edges of the [Card] (see https://github.com/flutter/flutter/issues/109776)
//           // This comes with a small performance cost, and you should not set [clipBehavior]
//           // unless you need it.
//           clipBehavior: Clip.hardEdge,
//           child: InkWell(
//             splashColor: Colors.blue.withAlpha(30),
//             onTap: () {
//               Navigator.push<void>(
//                 context,
//                 MaterialPageRoute<void>(
//                   builder: (BuildContext context) => const HydratationPage(),
//                 ),
//               );
//             },
//             child: const SizedBox(
//               width: 300,
//               height: 100,
//               child: Text('hydratation Page'),
//             ),
//           ),
//         ),
//       ]),
//     );
//   }
// }


