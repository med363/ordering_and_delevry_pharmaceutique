import 'package:flutter/material.dart';
import 'package:flutter_app/user/routes.dart';
import 'package:flutter_app/user/screens/tabbar/tabbar.dart';
import 'package:flutter_app/user/theme.dart';


class userpageApp extends StatelessWidget {
  final String username;

  userpageApp( {Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My_Pharmacy',
      theme: appTheme(),
      routes: routes,
      home: FRTabbarScreen(username: username),
    );
  }
}


 