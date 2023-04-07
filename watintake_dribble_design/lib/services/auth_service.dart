import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:watintake_dribble_design/constants/constants.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // Future signOutFromGoogle() async {
  //   await GoogleSignIn().signOut();
  //   await FirebaseAuth.instance.signOut();
  // }


// Future<UserCredential> signInToNutritionix(
//     signInPsswd, signInEmail, signInPhoneNumber) async {
//   final response = await http.post(
//     Uri.parse(NutritionixApiUrls.baseUrl + NutritionixApiUrlEndpoints.signIn),
//     body: {
//       "password": signInPsswd,
//       "email": signInEmail,
//       "phone_number": signInPhoneNumber
//     },
//   );

//   if (response.statusCode == 200) {
//     return json.decode(response.body)["user"] ;
//   } else {
//     return json.decode(response.body);
//   }
// }

// Future<User> signUpToNutritionix(signUpPsswd, signUpEmail,
//     signUpFirstName, signUpTimeZone, signUpRef) async {
//   //use the nutritionix api with endpoint
//   //https://trackapi.nutritionix.com/v2/auth/signup
//   final response = await http.post(
//     Uri.parse(NutritionixApiUrls.baseUrl + NutritionixApiUrlEndpoints.signUp),
//     body: {
//       "password": signUpPsswd,
//       "email": signUpEmail,
//       "first_name": signUpFirstName,
//       "timezone": signUpTimeZone,
//       "ref": signUpRef
//     },
//   );

//   if (response.statusCode == 200) {
//     return json.decode(response.body["x-user-jwt"]);
//   } else {
//     return json.decode(response);
//   }
// }
}
