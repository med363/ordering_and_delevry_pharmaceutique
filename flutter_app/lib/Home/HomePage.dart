import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_app/Home/Pharmacy_Page.dart';
import 'package:flutter_app/Home/Medication_Page.dart';
import 'package:flutter_app/Home/Magazin_Page.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Carossel/caroussel.dart';
import 'Question_Page.dart';

class PopularCategory {
  final String category;
  final String id;

  PopularCategory({this.category = '', this.id = ''});
}

class Product {
  final String title;
  final double star;
  final int sold;
  final double price;
  final String icon;
  final String id;

  Product(
      {this.title = '',
      this.star = 0.0,
      this.sold = 0,
      this.price = 0.0,
      this.icon = '',
      this.id = '0'});
}

final homePopularCategories = [
  PopularCategory(category: 'All', id: '1'),
  PopularCategory(category: 'Visage', id: '2'),
  PopularCategory(category: 'Cheveux', id: '3'),
  PopularCategory(category: 'Corps', id: '4'),
  PopularCategory(category: 'Bébé et Maman', id: '5'),
  PopularCategory(category: 'Compléments alimentaires', id: '6'),
  PopularCategory(category: 'Matériel médical', id: '7'),
  PopularCategory(category: 'Bio et Naturel', id: '8'),
  PopularCategory(category: 'Others', id: '9'),
];

final homePopularProducts = [
  Product(
    title: 'SVR',
    star: 4.5,
    sold: 8374,
    price: 52.900,
    icon: 'assets/icons/products/svr.jpg',
  ),
  Product(
    title: 'la roche',
    star: 4.7,
    sold: 7483,
    price: 56.900,
    icon: 'assets/icons/products/laroche.webp',
  ),
  Product(
    title: 'kreine',
    star: 4.3,
    sold: 6937,
    price: 40.00,
    icon: 'assets/icons/products/kreine.png',
  ),
  Product(
    title: 'apothica',
    star: 4.9,
    sold: 8174,
    price: 55.00,
    icon: 'assets/icons/products/apothica.png',
  ),
  Product(
    title: 'phsiomer',
    star: 4.9,
    sold: 8174,
    price: 16.000,
    icon: 'assets/icons/products/phsiomer.png',
  ),
  Product(
    title: 'sucette',
    star: 4.9,
    sold: 8174,
    price: 19.600,
    icon: 'assets/icons/products/sucette.png',
  ),
  Product(
    title: 'calino',
    star: 4.9,
    sold: 8174,
    price: 41.000,
    icon: 'assets/icons/products/calino.png',
  ),
  Product(
    title: 'mustela',
    star: 4.9,
    sold: 8174,
    price: 55.00,
    icon: 'assets/icons/products/mustela.png',
  ),
  Product(
    title: 'mustela1',
    star: 4.9,
    sold: 8174,
    price: 35.345,
    icon: 'assets/icons/products/mustela1.png',
  ),
  Product(
    title: 'pediakids',
    star: 4.9,
    sold: 8174,
    price: 9.900,
    icon: 'assets/icons/products/pediakids.png',
  ),
  Product(
    title: 'bionime',
    star: 4.9,
    sold: 8174,
    price: 80.600,
    icon: 'assets/icons/products/bionime.png',
  ),
  Product(
    title: 'beurer',
    star: 4.9,
    sold: 8174,
    price: 113.900,
    icon: 'assets/icons/products/beurer.png',
  ),
  Product(
    title: 'beurer-appareil',
    star: 4.9,
    sold: 8174,
    price: 376.600,
    icon: 'assets/icons/products/beurer-appareil.png',
  ),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        extendBodyBehindAppBar: false, // Important: extend body behind AppBar

        appBar: AppBar(
          backgroundColor: Colors.blue,
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
                icon: Icon(Icons.person),
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
              ),
            ),
          ],
        ),
        //inside the body
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              color: Colors.transparent,
            ),
            Container(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "What you search?",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                height: 200, // Set the desired height of the scrolling area
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Card(
                      shadowColor: Colors.black,
                      elevation: 9,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.white,
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        width: 150,
                        height: 250,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              child: Image.asset(
                                "assets/images/pharmacie.png",
                                width: 400,
                                height: 120,
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PharmacyPage()));
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Pharmacy",
                              textAlign:
                                  TextAlign.center, // Center text horizontally

                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10),

                    Card(
                      shadowColor: Colors.black,
                      elevation: 9,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.white,
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        width: 150,
                        height: 250,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              child: Image.asset(
                                "assets/images/medicament.png",
                                width: 400,
                                height: 120,
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MedicationPage()));
                              },
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Medication",
                              textAlign:
                                  TextAlign.center, // Center text horizontally

                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10), // Add space between cards

                    Card(
                      shadowColor: Colors.black,
                      elevation: 9,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.white,
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        width: 150,
                        height: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              child: Image.asset(
                                "assets/images/question.jpg",
                                width: 400,
                                height: 120,
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => QuestionPage()));
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Question",
                              textAlign:
                                  TextAlign.center, // Center text horizontally

                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10), // Add space between cards

                    Card(
                      shadowColor: Colors.black,
                      elevation: 9,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.white,
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        width: 150,
                        height: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              child: Image.asset(
                                "assets/images/med.png",
                                width: 400,
                                height: 120,
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MagazinPage()));
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Magazin",
                              textAlign:
                                  TextAlign.center, // Center text horizontally

                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
            Container(
              padding: const EdgeInsets.only(top: 20, left: 0, right: 10),
              child: Column(
                children: [
                  DestinationCarousel(),
                ],
              ),
            ),
            SizedBox(height: 20),
            MostPopularTitle(
              onTapseeAll: () {
                // Implement the action when "See All" is tapped.
                // You can navigate to another screen or perform any other action.
              },
            ),
            MostPupularCategory(),
            Container(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   "Categories",
                    //   style: GoogleFonts.oswald(
                    //     color: Colors.black,
                    //     fontSize: 32,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    //  // Adding some space between the title and the lists

                    // Container(
                    //   height: 200, // Adjust the height as needed
                    //   child: ListView.builder(
                    //     scrollDirection: Axis.horizontal,
                    //     itemCount: homePopularCategories.length,
                    //     itemBuilder: (context, index) {
                    //       PopularCategory category =
                    //           homePopularCategories[index];
                    //       return Container(
                    //         width: 150, // Adjust the width as needed
                    //         padding: EdgeInsets.all(8),
                    //         child: Column(
                    //           children: [
                    //             GestureDetector(
                    //               onTap: () {
                    //                 // Handle the button click here
                    //               },
                    //               child:
                    //               Container(
                    //                 width: 100,
                    //                 height: 100,
                    //                 decoration: BoxDecoration(
                    //                   color: Colors.black,
                    //                   borderRadius: BorderRadius.circular(10),
                    //                 ),
                    //                 child: Center(
                    //                   child: Text(
                    //                     category.category,
                    //                     style: TextStyle(
                    //                       color: Colors.white,
                    //                       fontSize: 18,
                    //                       fontWeight: FontWeight.bold,
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //             ),
                    //             // Add any other widgets to display category information
                    //             SizedBox(height: 10),
                    //          ],
                    //         ),
                    //       );
                    //     },
                    //   ),
                    // ),
                    // // Adding some space between the categories and the products
                    // Text(
                    //   "Popular Products:", // Optional, just for better organization
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //     fontSize: 22,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    Container(
                      padding:
                          const EdgeInsets.only(top: 20, left: 20, right: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           SizedBox(height: 10),
                            GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 5,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8,
                              ),
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: homePopularProducts.length,
                              itemBuilder: (context, index) {
                                Product product = homePopularProducts[index];
                                return ProductItem(product: product);
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ]),
        ),
        drawer: Drawer(
          width: 275,
          elevation: 30,
          backgroundColor: Color(0xF3393838),
          shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.horizontal(right: Radius.circular(30))),
          child: Container(
            decoration: const BoxDecoration(
                borderRadius:
                    BorderRadius.horizontal(right: Radius.circular(40)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.white, spreadRadius: 10, blurRadius: 10)
                ]),
            child: SafeArea(
              child: Column(
                children: [
                  ListTile(
                    dense: true,
                    title: Text("Home Page"),
                    leading: Icon(Icons.home),
                    onTap: () {
                      // Action when "Home Page" menu is pressed
                      // Add your desired action here
                      Navigator.pop(context); // Close the drawer
                    },
                  ),
                  ListTile(
                    dense: true,
                    title: Text("Pharmacy"),
                    leading: Icon(Icons.local_pharmacy),
                    onTap: () {
                      // Action when "My Profile" menu is pressed
                      // Add your desired action here
                      Navigator.pop(context); // Close the drawer
                    },
                  ),
                  ListTile(
                    dense: true,
                    title: Text("Medication"),
                    leading: Icon(Icons.medication),
                    onTap: () {
                      // Acti.on when "My Orders" menu is pressed
                      // Add your desired action here
                      Navigator.pop(context); // Close the drawer
                    },
                  ),
                  ListTile(
                    dense: true,
                    title: Text("Question"),
                    leading: Icon(Icons.help), // Icon for Question
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MagazinPage()));
                    },
                  ),
                  ListTile(
                    dense: true,
                    title: Text("Magazin"),
                    leading: Icon(Icons.margin),

                    // Icon for My Chat
                    onTap: () {
                      // Action when "My Chat" menu is pressed
                      // Add your desired action here
                      Navigator.pop(context); // Close the drawer
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class MostPupularCategory extends StatefulWidget {
  const MostPupularCategory({super.key});

  @override
  State<MostPupularCategory> createState() => _MostPupularCategoryState();
}

class _MostPupularCategoryState extends State<MostPupularCategory> {
  late final datas = homePopularCategories;

  int _selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildBody(),
      ],
    );
  }

  Widget _buildBody() {
    return SizedBox(
      height: 38,
      child: ListView.separated(
        itemCount: datas.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: _buildItem,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 12);
        },
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    final data = datas[index];
    final isActive = _selectIndex == index;
    const radius = BorderRadius.all(Radius.circular(19));
    return Container(
      decoration: BoxDecoration(
        borderRadius: radius,
        border: Border.all(color: const Color(0xFF101010), width: 2),
        color: isActive ? const Color(0xFF101010) : const Color(0xFFFFFFFF),
      ),
      alignment: Alignment.center,
      child: InkWell(
        borderRadius: radius,
        onTap: () => _onTapItem(index),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
          child: Text(
            data.category,
            style: TextStyle(
              color:
                  isActive ? const Color(0xFFFFFFFF) : const Color(0xFF101010),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  // user interact the item of special offers.
  void _onTapItem(int index) {
    setState(() {
      _selectIndex = index;
    });
  }
}

class MostPopularTitle extends StatelessWidget {
  const MostPopularTitle({
    Key? key,
    required this.onTapseeAll,
  }) : super(key: key);

  final Function onTapseeAll;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 17.0,
          horizontal: 9.0), // Add space both at the beginning and end
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Parapharmacie',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 34,
              color: Color(0xFF212121),
            ),
          ),
          TextButton(
            onPressed: () => onTapseeAll(),
            child: const Text(
              'See All',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xFF212121),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductItem extends StatefulWidget {
  final Product product;

  ProductItem({required this.product});

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle the product click here, e.g., show all the images of the product
        // Implement your logic to display all the images or navigate to a new page with more details about the product
      },
      child: Container(
        width: 150, // Adjust the width as needed
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Container(
              height: 80, // Set a fixed height for the image container
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  widget.product.icon,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(widget.product.title),
            SizedBox(height: 4),
            Text(
              'Price:${widget.product.price}TN', // Display the product price
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
                size: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
