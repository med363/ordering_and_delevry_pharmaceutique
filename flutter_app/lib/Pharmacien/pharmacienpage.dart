import 'package:flutter/material.dart';
import 'package:flutter_app/Pharmacien/routes.dart';
import 'package:flutter_app/Pharmacien/screens/tabbar/tabbar.dart';
import 'package:flutter_app/Pharmacien/theme.dart';

class pharmacienpageApp extends StatelessWidget {
  const pharmacienpageApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My_Pharma',
      theme: appTheme(),
      routes: routes,
      home: const FRTabbarScreen(),
    );
  }
}
