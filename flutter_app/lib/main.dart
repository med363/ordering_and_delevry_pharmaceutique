import 'package:flutter/material.dart';

import 'Feature/Login Screen/Login_Screen.dart';
import 'Home/HomePage.dart';
import 'User/pagehome_user.dart';
import 'User/TopMenus.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Set to false to remove the debug banner
      //  theme: ThemeData(
          // drawerTheme: const DrawerThemeData(scrimColor: Colors.white)),

      title: 'My_Med',
      home: HomePage_User(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    
return MaterialApp(
      home: HomePage(),
      routes: {
        '/login': (context) => LoginScreen(),
      },
    );
  }
}
