import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MagazinPage extends StatefulWidget {
  const MagazinPage({super.key});

  @override
  State<MagazinPage> createState() => _MagazinPageState();
}

class _MagazinPageState extends State<MagazinPage> {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                icon: Icon(Icons.person),
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
              ),
            ),
          ],
        ),
      body: Container(
            padding: const EdgeInsets.only(top: 100, left: 10, right: 10),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.camera_alt),
                      onPressed: () {
                        // Action lors du clic sur l'icône de l'appareil photo/vidéo
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.mic),
                      onPressed: () {
                        // Action lors du clic sur l'icône de la voix
                      },
                    ),
                  ],
                ),
                hintText: 'Rechercher des médicaments...',
              ),
            ),

    ));
  }
}