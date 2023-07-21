import 'dart:js';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class CardItem {
  final IconData iconData;
  final String title;
  final Color iconColor;
    final String routeName;



  const CardItem({
    required this.iconData,
    required this.title,
    required this.iconColor,
        required this.routeName,

  });
}

class _HomePageState extends State<HomePage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<CardItem> item = [
    CardItem(iconData: FontAwesomeIcons.medkit, title: "Pharmacie",iconColor: Colors.blue,routeName: PharmacyPage.routeName,),
    CardItem(iconData: FontAwesomeIcons.pills, title: "Medication",iconColor: Colors.green,routeName: MedicationPage.routeName,),
    CardItem(iconData: FontAwesomeIcons.question, title: "Question",iconColor: Colors.orange,routeName: QuestionPage.routeName,),
    CardItem(iconData: FontAwesomeIcons.magento, title: "Magazins",iconColor: Colors.red,routeName: MagazinsPage.routeName),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        extendBodyBehindAppBar: true, // Important: extend body behind AppBar

        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          // Set the color of the drawer icon
          leading: IconButton(
            icon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: SvgPicture.asset(
                'assets/images/menu.svg', // Replace with the path to your SVG file
                width: 24,
                height: 24,
              ),
            ),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: IconButton(
                icon: Icon(Icons.login),
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
              ),
            ),
          ],
        ),
        //inside the body
        body: Stack(children: [
          Container(


            color: Colors.transparent,
          ),
          Container(
            padding: const EdgeInsets.only(top: 100, left: 10, right: 10),
            child: Column(
              children: [
                Text(
                  "What you search?",
                  style: GoogleFonts.oswald(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 160, left: 1, right: 10),
            height: 250, // Set the desired height of the scrolling area
            child: ListView.separated(
                padding: EdgeInsets.all(16),
                scrollDirection:
                    Axis.horizontal, // Set the scroll direction to horizontal
                itemCount:item.length,
                separatorBuilder: (context, index) => SizedBox(
                      width: 12,
                    ),
                itemBuilder: (context, index) => buildCard(context,item: item[index])
                ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 160, left: 10, right: 10),
            height: 500,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              itemBuilder: (context, index) {
                return Container(
                  width: 200,
                  margin: EdgeInsets.symmetric(horizontal: 8),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 510, left: 10, right: 10),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Categories",
                  style: GoogleFonts.oswald(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 470, left: 10, right: 10),
            child: ListView.builder(
              // scrollDirection: Axis.horizontal,

              itemBuilder: (context, index) {
                return Card(
                  elevation: 20,
                  color: Color.fromARGB(255, 255, 255, 255).withOpacity(
                      0.6), // Replace with your desired "crystal" color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/med.png', // Replace with the image path
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 120,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "name", // Replace with the product name
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "price", // Replace with the product price
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ]),
        drawer: Drawer(
            width: 275,
            elevation: 30,
            backgroundColor: Colors.white,
            child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop(); // Close the drawer
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Icon(
                                Icons.arrow_back_ios,
                                color: Colors.black,
                                size: 20,
                              ),
                              SizedBox(
                                width: 0,
                              ),
                              Text(
                                'Back ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        )
                      ]),
                    ]))));
  }
}

Widget buildCard(BuildContext context,{required CardItem item}) => Container(
width: 100,
        color: Colors.white,
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, item.routeName);
          },
          child: Column(
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: 4 / 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Container(
                      color: item.iconColor,
                      child: Center(
                        child: Icon(
                          item.iconData,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                item.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      );


// Replace these with your desired destination pages
class PharmacyPage extends StatelessWidget {
    static const String routeName = '/pharmacy';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pharmacy Page"),
      ),
      body: Center(
        child: Text("This is the Pharmacy Page."),
      ),
    );
  }
}

class MedicationPage extends StatelessWidget {
    static const String routeName = '/medication';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Medication Page"),
      ),
      body: Center(
        child: Text("This is the Medication Page."),
      ),
    );
  }
}

class QuestionPage extends StatelessWidget {
    static const String routeName = '/question';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Question Page"),
      ),
      body: Center(
        child: Text("This is the Question Page."),
      ),
    );
  }
}

class MagazinsPage extends StatelessWidget {
    static const String routeName = '/magazin';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Magazins Page"),
      ),
      body: Center(
        child: Text("This is the Magazins Page."),
      ),
    );
  }
}