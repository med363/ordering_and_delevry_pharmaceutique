// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_app/user/models/user.dart';
// import 'package:flutter_app/user/screens/home/home.dart';

// import 'package:http/http.dart' as http;
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../../../user/provider/user_provider.dart';
// import '../../../user/userpage.dart';
// import '../../Sign Up Screen/SignUp_Screen.dart';
// import '../Login_Screen.dart';
// import '../utils/utils.dart';


// class AuthService {
//   void signUpUser({
//     required BuildContext context,
//     required String email,
//     required String phone,
//     required String password,
//     required String name,
//     required String passwordconf,
//     required String profession
//   }) async {
    
//       User user = User(
//         id: '',
//         name: name,
//         phone: phone,
//         password: password,
//         email: email,
//         passwordconf: passwordconf,
//         profession: profession
//       );
//         var response = await http.post(
//         Uri.parse('127.0.0.1:3000/registration_user'),
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
//   Future<void> signInUser({
//     required BuildContext context,
//     required String email,
//     required String password,
//   }) async {
//     try {
//       final userProvider = Provider.of<UserProvider>(context, listen: false);
//       final navigator = Navigator.of(context);

//       final res = await http.post(
//         Uri.parse('http://127.0.0.1/login_user'), // Add 'http://' here
//         body: jsonEncode({
//           // 'email': email,
//           'password': password,
//         }),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//       );

//       final userJsonResponse = jsonDecode(res.body);

//       if (res.statusCode == 200 && userJsonResponse['status']) {
//         // User login successful
//         final userToken = userJsonResponse['token'];

//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => userpageApp()),
//         );
//         print('User login successful');
//       } else {
//         // Handle login failure for user
//         print('User login failed');
//       }
//     } catch (e) {
//       // Handle exception during user login
//       print('Error during user login: $e');
//     }
  

//   } 


// }



