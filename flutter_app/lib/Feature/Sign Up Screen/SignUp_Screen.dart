import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../Core/Animation/Fade_Animation.dart';
import '../../Core/Colors/Hex_Color.dart';
import '../Login Screen/Login_Screen.dart';
import '../../config.dart';

enum FormData { Name, Phone, Email, password, ConfirmPassword, Profession }

class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  Color enabled = Color.fromARGB(255, 183, 208, 244);
  Color enabledtxt = Color.fromARGB(255, 43, 51, 118);
  Color deaible = Color.fromARGB(255, 43, 51, 118);
  Color backgroundColor = Color.fromARGB(255, 183, 208, 244);
  bool ispasswordev = true;
  bool isProfessional = false;
  bool showImageField = false;

  FormData? selected;

  TextEditingController nameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();
  TextEditingController ProfessionController = new TextEditingController();
  bool _isNotValidate = false;

  String? selectedProfession;
  File? _selectedImage;

  Future<void> _pickImage() async {
    final pickedImage = await ImagePicker().getImage(source: ImageSource.camera);

    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  bool _isPasswordMatch() {
    return passwordController.text == confirmPasswordController.text;
  }
  Map<String, IconData> professionIcons = {
    'Médecien': Icons.medical_services,
    'Pharmacien': Icons.local_pharmacy,
    'Infirmier': Icons.local_hospital,
    'Autre Profession santé': Icons.work,
    'Non': Icons.bookmark_border_outlined
  };

  
Future<void> registerUser() async {
  if (nameController.text.isNotEmpty &&
      phoneController.text.isNotEmpty &&
      emailController.text.isNotEmpty &&
      passwordController.text.isNotEmpty &&
      confirmPasswordController.text.isNotEmpty) {
    if (!_isPasswordMatch()) {
      setState(() {
        _isNotValidate = true;
      });
      return;
    }

    if (selectedProfession == null) {
      setState(() {
        _isNotValidate = true;
      });
      return;
    }

    if (selectedProfession == "Pharmacien") {
      var regBody = {
        "name": nameController.text,
        "phone": phoneController.text,
        "email": emailController.text,
        "password": passwordController.text,
        "passwordconf": confirmPasswordController.text,
        "profession": selectedProfession,
        // "image":_selectedImage,
       
      };

      var response = await http.post(
        Uri.parse(registration_pharmacien),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(regBody),
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        print(jsonResponse['status']);
        if (jsonResponse['status']) {
          // User registration successful
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        } else {
          print("Something Went Wrong");
        }
      } else {
        print("Failed to register user: ${response.statusCode}");
      }
    } else {
      var regBody = {
        "name": nameController.text,
        "phone": phoneController.text,
        "email": emailController.text,
        "password": passwordController.text,
        "passwordconf": confirmPasswordController.text,
      };

      var response = await http.post(
        Uri.parse(registration_user),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(regBody),
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        print(jsonResponse['status']);
        if (jsonResponse['status']) {
          // User registration successful
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        } else {
          print("Something Went Wrong");
        }
      } else {
        print("Failed to register user: ${response.statusCode}");
      }
    }
  } else {
    setState(() {
      _isNotValidate = true;
    });
  }
}
 
  List<String> professions = [
    'Médecien',
    'Pharmacien',
    'Infirmier',
    'Autre Profession santé',
    'Non'
  ];

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
                      elevation: 6,
                      color: const Color.fromARGB(255, 255, 255, 255)
                          .withOpacity(0.4),
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
                              child: Container(
                                child: Text(
                                  "Create your account",
                                  style: TextStyle(
                                      color: Colors.black, letterSpacing: 0.5),
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
                                  color: selected == FormData.Email
                                      ? enabled
                                      : backgroundColor,
                                ),
                                padding: const EdgeInsets.all(5.0),
                                child: TextField(
                                  controller: nameController,
                                  onTap: () {},
                                  decoration: InputDecoration(
                                    enabledBorder: InputBorder.none,
                                    border: InputBorder.none,
                                    filled: true,
                                    errorText: _isNotValidate
                                        ? "⛔Entrer proper info!"
                                        : null,
                                    prefixIcon: Icon(
                                      Icons.title,
                                      color: selected == FormData.Name
                                          ? enabledtxt
                                          : deaible,
                                      size: 20,
                                    ),
                                    hintText: 'Full Name',
                                    hintStyle: TextStyle(
                                        color: selected == FormData.Name
                                            ? enabledtxt
                                            : deaible,
                                        fontSize: 12),
                                  ),
                                  textAlignVertical: TextAlignVertical.center,
                                  style: TextStyle(
                                      color: selected == FormData.Name
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
                                  color: selected == FormData.Phone
                                      ? enabled
                                      : backgroundColor,
                                ),
                                padding: const EdgeInsets.all(5.0),
                                child: TextField(
                                  controller: phoneController,
                                  onTap: () {},
                                  decoration: InputDecoration(
                                    enabledBorder: InputBorder.none,
                                    border: InputBorder.none,
                                    filled: true,
                                    errorText: _isNotValidate
                                        ? "⛔Entrer proper info!"
                                        : null,
                                    prefixIcon: Icon(
                                      Icons.phone_android_rounded,
                                      color: selected == FormData.Phone
                                          ? enabledtxt
                                          : deaible,
                                      size: 20,
                                    ),
                                    hintText: 'Phone Number',
                                    hintStyle: TextStyle(
                                        color: selected == FormData.Phone
                                            ? enabledtxt
                                            : deaible,
                                        fontSize: 12),
                                  ),
                                  textAlignVertical: TextAlignVertical.center,
                                  style: TextStyle(
                                      color: selected == FormData.Phone
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
                                  color: selected == FormData.Email
                                      ? enabled
                                      : backgroundColor,
                                ),
                                padding: const EdgeInsets.all(5.0),
                                child: TextField(
                                  controller: emailController,
                                  onTap: () {},
                                  decoration: InputDecoration(
                                    enabledBorder: InputBorder.none,
                                    border: InputBorder.none,
                                    filled: true,
                                    errorText: _isNotValidate
                                        ? "⛔Entrer proper info!"
                                        : null,
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
                                  onTap: () {},
                                  decoration: InputDecoration(
                                      enabledBorder: InputBorder.none,
                                      border: InputBorder.none,
                                      filled: true,
                                      errorText: _isNotValidate
                                          ? "⛔Entrer proper info!"
                                          : null,
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
                              child: Container(
                                width: 300,
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    color: selected == FormData.ConfirmPassword
                                        ? enabled
                                        : backgroundColor),
                                padding: const EdgeInsets.all(5.0),
                                child: TextField(
                                  controller: confirmPasswordController,
                                  onTap: () {},
                                  decoration: InputDecoration(
                                      enabledBorder: InputBorder.none,
                                      border: InputBorder.none,
                                      filled: true,
                                      errorText:
                                          !_isPasswordMatch() && _isNotValidate
                                              ? "⚠️Passwords do not match!"
                                              : null,
                                      prefixIcon: Icon(
                                        Icons.lock_open_outlined,
                                        color:
                                            selected == FormData.ConfirmPassword
                                                ? enabledtxt
                                                : deaible,
                                        size: 20,
                                      ),
                                      suffixIcon: IconButton(
                                        icon: ispasswordev
                                            ? Icon(
                                                Icons.visibility_off,
                                                color: selected ==
                                                        FormData.ConfirmPassword
                                                    ? enabledtxt
                                                    : deaible,
                                                size: 20,
                                              )
                                            : Icon(
                                                Icons.visibility,
                                                color: selected ==
                                                        FormData.ConfirmPassword
                                                    ? enabledtxt
                                                    : deaible,
                                                size: 20,
                                              ),
                                        onPressed: () => setState(
                                            () => ispasswordev = !ispasswordev),
                                      ),
                                      hintText: 'Confirm Password',
                                      hintStyle: TextStyle(
                                          color: selected ==
                                                  FormData.ConfirmPassword
                                              ? enabledtxt
                                              : deaible,
                                          fontSize: 12)),
                                  obscureText: ispasswordev,
                                  textAlignVertical: TextAlignVertical.center,
                                  style: TextStyle(
                                      color:
                                          selected == FormData.ConfirmPassword
                                              ? enabledtxt
                                              : deaible,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            // Ajouter les icônes correspondant à chaque profession
                            FadeAnimation(
                              delay: 1,
                              child: Container(
                                width: 300,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: selected == FormData.Profession
                                      ? enabled
                                      : backgroundColor,
                                ),
                                padding: const EdgeInsets.all(5.0),
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  value: selectedProfession,
                                  items: professions.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            professionIcons[value],
                                            color:
                                                selected == FormData.Profession
                                                    ? enabledtxt
                                                    : deaible,
                                            size: 20,
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            value,
                                            style: TextStyle(
                                              color: selected ==
                                                      FormData.Profession
                                                  ? enabledtxt
                                                  : deaible,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedProfession = newValue;
                                    });
                                  },
                                  style: TextStyle(
                                    color: selected == FormData.Profession
                                        ? enabledtxt
                                        : deaible,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    color: selected == FormData.Profession
                                        ? enabledtxt
                                        : deaible,
                                    size: 20,
                                  ),
                                  underline: SizedBox(),
                                  hint: Text(
                                    'Êtes-vous professionnel de santé ',
                                    style: TextStyle(
                                      color: selected == FormData.Profession
                                          ? enabledtxt
                                          : deaible,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(
                              height: 25,
                            ),

                            // Photo du carte du travaille?
                            FadeAnimation(
                              delay: 1,
                              child: Container(
                                width: 300,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: selected == FormData.Profession
                                      ? enabled
                                      : backgroundColor,
                                ),
                                padding: const EdgeInsets.all(5.0),
                                child: InkWell(
                                  onTap: () async {
                                    PickedFile? imageFile =
                                        await ImagePicker().getImage(
                                      source: ImageSource.camera,
                                    );

                                    if (imageFile != null) {
                                      setState(() {
                                        _selectedImage = File(imageFile.path);
                                      });
                                    }
                                  },
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.camera_alt,
                                          color: selected == FormData.Profession
                                              ? enabledtxt
                                              : deaible,
                                          size: 20,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Photo du carte du travaille?',
                                          style: TextStyle(
                                            color:
                                                selected == FormData.Profession
                                                    ? enabledtxt
                                                    : deaible,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                      Radio<bool>(
                                        value: true,
                                        groupValue: isProfessional,
                                        onChanged: (value) {
                                          setState(() {
                                            isProfessional = value!;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                             const SizedBox(
                              height: 25,
                            ),
                            FadeAnimation(
                              delay: 1,
                              child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      _isNotValidate = false;
                                    });
                                    registerUser();
                                  },
                                  child: Text(
                                    "Sign Up",
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
                          const Text("If you have an account ",
                              style: TextStyle(
                                color: Color.fromARGB(255, 60, 51, 51),
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
