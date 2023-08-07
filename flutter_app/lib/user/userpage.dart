import 'package:flutter/material.dart';
import 'package:flutter_app/user/routes.dart';
import 'package:flutter_app/user/screens/tabbar/tabbar.dart';
import 'package:flutter_app/user/theme.dart';

class userpageApp extends StatelessWidget {
  const userpageApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My_Pharmacy',
      theme: appTheme(),
      routes: routes,
      home: const FRTabbarScreen(),
    );
  }
}
