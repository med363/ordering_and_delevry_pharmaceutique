import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

  Product({
    this.title = '',
    this.star = 0.0,
    this.sold = 0,
    this.price = 0.0,
    this.icon = '',
    this.id = '0',
  });
}

final homePopularProducts = [
  // Vos produits ici
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
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: SvgPicture.asset(
              'assets/images/menu.svg',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Le reste du contenu de votre page ici
            // ...
            // Affichage des produits dans une grille
            Container(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Popular Products:",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
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
      drawer: Drawer(
        // Le contenu de votre tiroir ici
        // ...
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
        // Gérer le clic sur le produit ici, par exemple, afficher toutes les images du produit
        // Implémentez votre logique pour afficher toutes les images ou naviguer vers une nouvelle page avec plus de détails sur le produit
      },
      child: Container(
        width: 150,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Container(
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  widget.product.icon,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(widget.product.title),
            SizedBox(height: 4),
            Text(
              'Price: \$${widget.product.price}',
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

// Les autres classes et widgets que vous avez définis ici
// ...
