import 'package:flutter/material.dart';

import 'package:flutter_app/Pharmacien/screens/home/home.dart';
import 'package:flutter_app/Pharmacien/screens/profile/profile_screen.dart';
import 'package:flutter_app/Pharmacien/screens/special_offers/special_offers_screen.dart';
import 'package:flutter_app/Pharmacien/screens/test/test_screen.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.route(): (context) =>  HomeScreen(title: 'My Home', username: '',),
  SpecialOfferScreen.route(): (context) => const SpecialOfferScreen(),
  ProfileScreen.route(): (context) =>  ProfileScreen(username: '',),
  TestScreen.route(): (context) => const TestScreen(),
};
