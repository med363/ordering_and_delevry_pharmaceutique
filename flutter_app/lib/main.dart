import 'package:flutter/material.dart';
import 'Home/HomePage.dart';

void main() {
  runApp( const MyApp(  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //  theme: ThemeData(
          // drawerTheme: const DrawerThemeData(scrimColor: Colors.white)),

      title: 'ordering delivry pharmaceutique',
      home:  MyHomePage(title: 'Flutter Demo Home Page'),
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
    
    return Scaffold(
      backgroundColor: Colors.white,
        body: SafeArea(
          child: HomePage() ,
          ),
    );
  }
}
