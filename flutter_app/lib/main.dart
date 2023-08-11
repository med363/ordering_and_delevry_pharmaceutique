import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/user/provider/pharmacie_provider.dart';
import 'package:flutter_app/user/provider/user_provider.dart';
import 'package:provider/provider.dart';

import 'Feature/Login Screen/Login_Screen.dart';
import 'Home/HomePage.dart';
import 'package:flutter_app/user/userpage.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
                ChangeNotifierProvider(
          create: (context) => pharmacieProvider(), // Add CartProvider here
        ),

      ],// Replace with your UserProvider instantiation
      child: MyApp(),

    ) 
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, // Set to false to remove the debug banner

      theme: ThemeData(
          drawerTheme: const DrawerThemeData(scrimColor: Colors.transparent)),

      title: 'My_pharmacy',
      home: MyHomePage(title: 'Flutter Demo Home Page', ),

      // routes: {
      //   '/login': (context) => LoginScreen(),
      //   '/user': (context) => userpageApp(),
      // },
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
      debugShowCheckedModeBanner:
          false, // Set to false to remove the debug banner

      home: HomePage(),

      routes: {
        '/login': (context) => LoginScreen(),
        '/user': (context) => userpageApp( ),
      },
    );
  }
}
