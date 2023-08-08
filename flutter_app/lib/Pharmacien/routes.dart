import 'package:flutter/material.dart';

import 'package:flutter_app/Pharmacien/screens/home/home.dart';
import 'package:flutter_app/Pharmacien/screens/profile/profile_screen.dart';
import 'package:flutter_app/Pharmacien/screens/special_offers/special_offers_screen.dart';
import 'package:flutter_app/Pharmacien/screens/test/test_screen.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.route(): (context) => const HomeScreen(title: '123'),
  SpecialOfferScreen.route(): (context) => const SpecialOfferScreen(),
  ProfileScreen.route(): (context) => const ProfileScreen(),
  TestScreen.route(): (context) => const TestScreen(),
};
