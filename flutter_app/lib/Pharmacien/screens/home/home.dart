import 'package:flutter/material.dart';
import 'package:flutter_app/Pharmacien/screens/home/hearder.dart';
import 'package:flutter_app/Pharmacien/screens/home/search_field.dart';
import 'package:flutter_app/Pharmacien/screens/home/search_field1.dart';
import 'package:flutter_app/Pharmacien/screens/home/special_offer.dart';
import 'package:flutter_app/Pharmacien/screens/special_offers/special_offers_screen.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  final String username;
  static String route() => '/home';

  HomeScreen({super.key, required this.title,required this.username});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // late final datas = homePopularProducts;

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.fromLTRB(24, 24, 24, 0);
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
           SliverPadding(
            padding: EdgeInsets.only(top: 24),
            sliver: SliverAppBar(
              pinned: true,
              flexibleSpace: HomeAppBar(username: widget.username),
            ),
          ),
          SliverPadding(
            padding: padding,
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                ((context, index) => _buildBody(context)),
                childCount: 1,
              ),
            ),
          ),
          // SliverPadding(
          //   padding: padding,
          //   sliver: _buildPopulars(),
          // ),
          const SliverAppBar(flexibleSpace: SizedBox(height: 24))
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        SearchField(),
        const SizedBox(height: 10),
        SearchField1(),
        const SizedBox(height: 24),
        SpecialOffers(onTapSeeAll: () => _onTapSpecialOffersSeeAll(context)),
        // const SizedBox(height: 24),
        // MostPopularTitle(onTapseeAll: () => _onTapMostPopularSeeAll(context)),
        // const SizedBox(height: 24),
        // const MostPupularCategory(),
      ],
    );
  }

  // Widget _buildPopulars() {
  //   return SliverGrid(
  //     gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
  //       maxCrossAxisExtent: 185,
  //       mainAxisSpacing: 24,
  //       crossAxisSpacing: 16,
  //       mainAxisExtent: 285,
  //     ),
  //     delegate: SliverChildBuilderDelegate(_buildPopularItem, childCount: 30),
  //   );
  // }

  // Widget _buildPopularItem(BuildContext context, int index) {
  //   final data = datas[index % datas.length];
  //   return ProductCard(
  //     data: data,
  //     ontap: (data) => Navigator.pushNamed(context, ShopDetailScreen.route()),
  //   );
  // }

  // void _onTapMostPopularSeeAll(BuildContext context) {
  //   Navigator.pushNamed(context, MostPopularScreen.route());
  // }

  void _onTapSpecialOffersSeeAll(BuildContext context) {
    Navigator.pushNamed(context, SpecialOfferScreen.route());
  }
}
