import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../Core/Animation/Fade_Animation.dart';
import '../../Core/Colors/Hex_Color.dart';
import '../../User/userpage.dart';
import '../Login Screen/Login_Screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../config.dart';

class PinCodeVerificationScreen extends StatefulWidget {
  @override
  State<PinCodeVerificationScreen> createState() =>
      _PinCodeVerificationScreenState();
}

class _PinCodeVerificationScreenState extends State<PinCodeVerificationScreen> {
  TextEditingController textEditingController = TextEditingController();
  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  void verfierCodeUser() async {
    if (textEditingController.text.isNotEmpty) {
      var reqBody = {"resetCode": textEditingController.text};

      try {
        var userResponse = await http.post(
          Uri.parse(code_user),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(reqBody),
        );

        if (userResponse.statusCode == 200) {
           Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          print('email bien envoyer');
        } else {
          // Handle non-200 status code
          print('Server returned status code ${userResponse.statusCode}');
        }
      } catch (e) {
        // Handle exception during user login
        print('Error during user login: $e');
      }
    } else {
      print('Email field is empty');
    }
  }

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
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
                      color: const Color.fromARGB(255, 255, 255, 255)
                          .withOpacity(0.4),
                      child: Container(
                        width: 500,
                        padding: const EdgeInsets.all(30.0),
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
                              child: Container(
                                child: Text(
                                  "Let us help you",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.9),
                                      letterSpacing: 0.5),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                'Code Number Verification',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30.0, vertical: 8),
                              child: RichText(
                                text: TextSpan(
                                    text: "Enter the code sent to email ",
                                    children: [
                                      // TextSpan(
                                      //     text: "${widget.phoneNumber}",
                                      //
                                      //    style: const TextStyle(
                                      //           color: Colors.black,
                                      //           fontWeight: FontWeight.bold,
                                      //           fontSize: 15)),
                                      //
                                    ],
                                    style: const TextStyle(
                                        color: Colors.black54, fontSize: 15)),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Form(
                              key: formKey,
                              child: PinCodeTextField(
                                appContext: context,
                                pastedTextStyle: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                                length: 6,
                                obscureText: true,
                                obscuringCharacter: '*',
                                obscuringWidget: const Icon(
                                  Icons.pets,
                                  color: Colors.blue,
                                  size: 24,
                                ),
                                blinkWhenObscuring: true,
                                animationType: AnimationType.fade,
                                validator: (v) {
                                  if (v!.length < 3) {
                                    return "Validate me";
                                  } else {
                                    return null;
                                  }
                                },
                                pinTheme: PinTheme(
                                    shape: PinCodeFieldShape.box,
                                    borderRadius: BorderRadius.circular(5),
                                    fieldHeight: 50,
                                    fieldWidth: 40,
                                    activeFillColor: Colors.white,
                                    inactiveFillColor: Colors.white),
                                cursorColor: Colors.black,
                                animationDuration:
                                    const Duration(milliseconds: 300),
                                enableActiveFill: true,
                                errorAnimationController: errorController,
                                controller: textEditingController,
                                keyboardType: TextInputType.number,
                                boxShadows: const [
                                  BoxShadow(
                                    offset: Offset(0, 1),
                                    color: Colors.black12,
                                    blurRadius: 10,
                                  )
                                ],
                                onCompleted: (v) {
                                  debugPrint("Completed");
                                },
                                // onTap: () {
                                //   print("Pressed");
                                // },
                                onChanged: (value) {
                                  debugPrint(value);
                                  setState(() {
                                    currentText = value;
                                  });
                                },
                                beforeTextPaste: (text) {
                                  debugPrint("Allowing to paste $text");
                                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                                  return true;
                                },
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30.0),
                              child: Text(
                                hasError
                                    ? "*Please fill up all the cells properly"
                                    : "",
                                style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Didn't receive the code? ",
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 15),
                                ),
                                TextButton(
                                  onPressed: () => snackBar("OTP resend!!"),
                                  child: const Text(
                                    "RESEND",
                                    style: TextStyle(
                                        color: Color(0xFF91D3B3),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            FadeAnimation(
                              delay: 1,
                              child: TextButton(
                                  onPressed: () {
                                    // formKey.currentState!.validate();
                                    // // conditions for validating
                                    // if (currentText.length != 6 ||
                                    //     currentText != "123456") {
                                    //   errorController!.add(ErrorAnimationType
                                    //       .shake); // Triggering error shake animation
                                    //   setState(() => hasError = true);
                                    // } else {
                                    //   setState(
                                    //     () {
                                    //       hasError = false;
                                    //       snackBar("OTP Verified!!");
                                    //     },
                                    //   );
                                    // }
                                    verfierCodeUser();
                                  },
                                  child: Text(
                                    "Verify",
                                    style: TextStyle(
                                      color: Colors.white,
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
                      height: 20,
                    ),

                    FadeAnimation(
                      delay: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text("Want to try again? ",
                              style: TextStyle(
                                color: Colors.grey,
                                letterSpacing: 0.5,
                              )),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return LoginScreen();
                              }));
                            },
                            child: Text("Sing in",
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.9),
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