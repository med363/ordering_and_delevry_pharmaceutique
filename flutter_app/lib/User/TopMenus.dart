import 'package:flutter/material.dart';

class TopMenus extends StatefulWidget {
  @override
  _TopMenusState createState() => _TopMenusState();
}

class _TopMenusState extends State<TopMenus> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          TopMenuTiles("Burger", "ic_burger", ""),
          TopMenuTiles("Sushi", "ic_sushi", ""),
          TopMenuTiles("Pizza", "ic_pizza", ""),
          TopMenuTiles("Cake", "ic_cake", ""),
          TopMenuTiles("Ice Cream", "ic_ice_cream", ""),
          TopMenuTiles("Soft Drink", "ic_soft_drink", ""),
          TopMenuTiles("Burger", "ic_burger", ""),
          TopMenuTiles("Sushi", "ic_sushi", ""),
        ],
      ),
    );
  }
}

class TopMenuTiles extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String slug;

  const TopMenuTiles(
    this.name,
    this.imageUrl,
    this.slug,
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFfae3e2),
                  blurRadius: 25.0,
                  offset: Offset(0.0, 0.75),
                ),
              ],
            ),
            child: Card(
              color: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3.0),
              ),
              child: Container(
                width: 50,
                height: 50,
                child: Center(
                  child: Image.asset(
                    'assets/images/topmenu/$imageUrl.png',
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
            ),
          ),
          Text(
            name,
            style: TextStyle(
              color: Color(0xFF6e6e71),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
