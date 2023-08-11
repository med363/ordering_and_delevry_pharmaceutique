// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_app/user/models/pharmacie.dart';
// import 'package:flutter_app/user/models/user.dart';
// import 'package:flutter_app/user/provider/pharmacie_provider.dart';
// import 'package:flutter_app/user/screens/home/home.dart';

// import 'package:http/http.dart' as http;
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../../../Pharmacien/pharmacienpage.dart';
// import '../../../user/provider/pharmacie_provider.dart';
// import '../../../user/provider/pharmacie_provider.dart';
// import '../../../user/provider/pharmacie_provider.dart';
// import '../../../user/provider/user_provider.dart';
// import '../../../user/userpage.dart';
// import '../../Sign Up Screen/SignUp_Screen.dart';
// import '../Login_Screen.dart';
// import '../utils/utils.dart';


// class AuthService {
//   void signUpPharmacien({
//     required BuildContext context,
//     required String email,
//     required String phone,
//     required String password,
//     required String name,
//     required String passwordconf,
//     required String profession,
//     required String image
//   }) async {
    
//       pharmacie user = pharmacie(
//         id: '',
//         name: name,
//         phone: phone,
//         password: password,
//         email: email,
//         passwordconf: passwordconf,
//         profession: profession,
//         image: image
//       );
//         var response = await http.post(
//         Uri.parse('127.0.0.1:3000/registration_pharmacien'),
//         headers: {"Content-Type": "application/json"},
//         body: user.toJson(),
//              );
//       if (response.statusCode == 200) {
//         var jsonResponse = jsonDecode(response.body);
//         print(jsonResponse['status']);
//         if (jsonResponse['status']) {
//           // User registration successful
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => LoginScreen()),
//           );
//         } else {
//           print("Something Went Wrong");
//         }
//       } else {
//         print("Failed to register user: ${response.statusCode}");
//       }
//     }
//     void signInPharmacien({
//     required BuildContext context,
//     required String email,
//     required String password,
//   }) async {
//     try {
//       var PharmacieProvider = Provider.of<pharmacieProvider>(context, listen: false);
//       final navigator = Navigator.of(context);
//       http.Response res = await http.post(
//         Uri.parse('127.0.0.1/login_user'),
//         body: jsonEncode({
//           'email': email,
//           'password': password,
//         }),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//       );
// var pharmacyJsonResponse = jsonDecode(res.body);

//       if (res.statusCode == 200 && pharmacyJsonResponse['status']) {
//         // Pharmacy login successful
//         var pharmacyToken = pharmacyJsonResponse['token'];
//         // prefs.setString('token', pharmacyToken);
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => pharmacienpageApp()),
//         );
//         print('Pharmacy login successful');
//       } else {
//         // Handle login failure for pharmacy
//         print('Pharmacy login failed');
//       }
//     } catch (e) {
//       // Handle exception during pharmacy login
//       print('Error during pharmacy login: $e');
//     }  }

//   } 


    


