import 'package:flutter/material.dart';
import 'package:flutter_app/user/screens/detail/detail_screen.dart';
import 'package:flutter_app/user/screens/home/home.dart';
import 'package:flutter_app/user/screens/mostpopular/most_popular_screen.dart';
import 'package:flutter_app/user/screens/profile/profile_screen.dart';
import 'package:flutter_app/user/screens/special_offers/special_offers_screen.dart';
import 'package:flutter_app/user/screens/test/test_screen.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.route(): (context) => const HomeScreen(title: '123'),
  MostPopularScreen.route(): (context) => const MostPopularScreen(),
  SpecialOfferScreen.route(): (context) => const SpecialOfferScreen(),
  ProfileScreen.route(): (context) => const ProfileScreen(),
  ShopDetailScreen.route(): (context) => const ShopDetailScreen(),
  TestScreen.route(): (context) => const TestScreen(),
};
