import 'package:flutter/material.dart';
import '../../Core/Animation/Fade_Animation.dart';
import '../../Core/Colors/Hex_Color.dart';
import '../Forgot Password/Forgot_Password_Screen.dart';
import '../Sign Up Screen/SignUp_Screen.dart';
import 'package:flutter_app/user/userpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../config.dart';
import '../../Pharmacien/pharmacienpage.dart';

enum FormData {
  Email,
  password,
}

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Color enabled = Color.fromARGB(255, 183, 208, 244);
  Color enabledtxt = Color.fromARGB(255, 43, 51, 118);
  Color deaible = Color.fromARGB(255, 43, 51, 118);
  Color backgroundColor = Color.fromARGB(255, 183, 208, 244);
  bool ispasswordev = true;
  FormData? selected;

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  bool _isNotValidate = false;
  late SharedPreferences prefs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSharedPref();
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  void loginUser() async {
  if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
    var reqBody = {
      "email": emailController.text,
      "password": passwordController.text,
    };

    try {
      // Attempt to log in as a user
      var userResponse = await http.post(
        Uri.parse(login_user),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(reqBody),
      );

      var userJsonResponse = jsonDecode(userResponse.body);
      
      if (userResponse.statusCode == 200 && userJsonResponse['status']) {
        // User login successful
        var userToken = userJsonResponse['token'];
        prefs.setString('token', userToken);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => userpageApp()),
        );
        print('User login successful');
      } else {
        // Handle login failure for user
        print('User login failed');
      }
    } catch (e) {
      // Handle exception during user login
      print('Error during user login: $e');
    }

    try {
      // Attempt to log in as a pharmacy
      var pharmacyResponse = await http.post(
        Uri.parse(login_pharmacien),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(reqBody),
      );

      var pharmacyJsonResponse = jsonDecode(pharmacyResponse.body);

      if (pharmacyResponse.statusCode == 200 && pharmacyJsonResponse['status']) {
        // Pharmacy login successful
        var pharmacyToken = pharmacyJsonResponse['token'];
        prefs.setString('token', pharmacyToken);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => pharmacienpageApp()),
        );
        print('Pharmacy login successful');
      } else {
        // Handle login failure for pharmacy
        print('Pharmacy login failed');
      }
    } catch (e) {
      // Handle exception during pharmacy login
      print('Error during pharmacy login: $e');
    }
  }
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [0.1, 0.4, 0.7, 0.9],
                colors: [
                  HexColor("#6FB9EE").withOpacity(0.8),
                  HexColor("#6FB9EE"),
                  HexColor("#6FB9EE"),
                  HexColor("#6FB9EE")
                ],
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    HexColor("#fff").withOpacity(0.2), BlendMode.dstATop),
                image: AssetImage('assets/images/1.jpg'),
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      elevation: 5,
                      color:
                          Color.fromARGB(255, 255, 255, 255).withOpacity(0.4),
                      child: Container(
                        width: 400,
                        padding: const EdgeInsets.all(40.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FadeAnimation(
                              delay: 0.8,
                              child: Image.asset(
                                "assets/images/3.png",
                                width: 100,
                                height: 100,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            FadeAnimation(
                              delay: 1,
                              child: const Text(
                                "Please sign in to continue",
                                style: TextStyle(
                                    color: Colors.black, letterSpacing: 0.5),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            FadeAnimation(
                              delay: 1,
                              child: Container(
                                width: 300,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: selected == FormData.Email
                                      ? enabled
                                      : backgroundColor,
                                ),
                                padding: const EdgeInsets.all(5.0),
                                child: TextField(
                                  controller: emailController,
                                  onTap: () {
                                    setState(() {
                                      selected = FormData.Email;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    enabledBorder: InputBorder.none,
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.email_outlined,
                                      color: selected == FormData.Email
                                          ? enabledtxt
                                          : deaible,
                                      size: 20,
                                    ),
                                    hintText: 'Email',
                                    hintStyle: TextStyle(
                                        color: selected == FormData.Email
                                            ? enabledtxt
                                            : deaible,
                                        fontSize: 12),
                                  ),
                                  textAlignVertical: TextAlignVertical.center,
                                  style: TextStyle(
                                      color: selected == FormData.Email
                                          ? enabledtxt
                                          : deaible,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            FadeAnimation(
                              delay: 1,
                              child: Container(
                                width: 300,
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    color: selected == FormData.password
                                        ? enabled
                                        : backgroundColor),
                                padding: const EdgeInsets.all(5.0),
                                child: TextField(
                                  controller: passwordController,
                                  onTap: () {
                                    setState(() {
                                      selected = FormData.password;
                                    });
                                  },
                                  decoration: InputDecoration(
                                      enabledBorder: InputBorder.none,
                                      border: InputBorder.none,
                                      prefixIcon: Icon(
                                        Icons.lock_open_outlined,
                                        color: selected == FormData.password
                                            ? enabledtxt
                                            : deaible,
                                        size: 20,
                                      ),
                                      suffixIcon: IconButton(
                                        icon: ispasswordev
                                            ? Icon(
                                                Icons.visibility_off,
                                                color: selected ==
                                                        FormData.password
                                                    ? enabledtxt
                                                    : deaible,
                                                size: 20,
                                              )
                                            : Icon(
                                                Icons.visibility,
                                                color: selected ==
                                                        FormData.password
                                                    ? enabledtxt
                                                    : deaible,
                                                size: 20,
                                              ),
                                        onPressed: () => setState(
                                            () => ispasswordev = !ispasswordev),
                                      ),
                                      hintText: 'Password',
                                      hintStyle: TextStyle(
                                          color: selected == FormData.password
                                              ? enabledtxt
                                              : deaible,
                                          fontSize: 12)),
                                  obscureText: ispasswordev,
                                  textAlignVertical: TextAlignVertical.center,
                                  style: TextStyle(
                                      color: selected == FormData.password
                                          ? enabledtxt
                                          : deaible,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            FadeAnimation(
                              delay: 1,
                              child: TextButton(
                                  // onPressed: () {
                                  //   // Navigator.pop(context);
                                  //   // Navigator.of(context)
                                  //   //     .push(MaterialPageRoute(builder: (context) {
                                  //   //   return MyApp(isLogin: true);
                                  //   // }));
                                  // },
                                  onPressed: loginUser,
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.black,
                                      letterSpacing: 0.5,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  style: TextButton.styleFrom(
                                      backgroundColor: const Color(0xFF2697FF),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 14.0, horizontal: 80),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0)))),
                            ),
                          ],
                        ),
                      ),
                    ),

                    //End of Center Card
                    //Start of outer card
                    const SizedBox(
                      height: 10,
                    ),
                    FadeAnimation(
                      delay: 1,
                      child: GestureDetector(
                        onTap: (() {
                          Navigator.pop(context);
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return ForgotPasswordScreen();
                          }));
                        }),
                        child: Text("Can't Log In?",
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.9),
                              letterSpacing: 0.5,
                            )),
                      ),
                    ),
                    const SizedBox(height: 10),
                    FadeAnimation(
                      delay: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text("Don't have an account? ",
                              style: TextStyle(
                                color: Colors.black,
                                letterSpacing: 0.5,
                              )),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return SignupScreen();
                              }));
                            },
                            child: Text("Sign up",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5,
                                    fontSize: 14)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
