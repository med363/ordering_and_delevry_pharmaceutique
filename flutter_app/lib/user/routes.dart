import 'package:flutter/material.dart';
import 'package:flutter_app/user/screens/detail/detail_screen.dart';
import 'package:flutter_app/user/screens/home/home.dart';
import 'package:flutter_app/user/screens/mostpopular/most_popular_screen.dart';
import 'package:flutter_app/user/screens/profile/profile_screen.dart';
import 'package:flutter_app/user/screens/special_offers/special_offers_screen.dart';
import 'package:flutter_app/user/screens/test/test_screen.dart';



final Map<String, WidgetBuilder> routes = {
  HomeScreen.route(): (context) =>HomeScreen(title: 'My Home', username: ''),
  MostPopularScreen.route(): (context) => const MostPopularScreen(),
  SpecialOfferScreen.route(): (context) => const SpecialOfferScreen(),
  ProfileScreen.route(): (context) => ProfileScreen(username: ''),
  ShopDetailScreen.route(): (context) => const ShopDetailScreen(),
  TestScreen.route(): (context) => const TestScreen(),
};