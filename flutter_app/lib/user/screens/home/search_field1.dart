import 'dart:developer';

import 'package:flutter/material.dart';

class SearchField1 extends StatelessWidget {
  const SearchField1 ({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFf3f3f3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      centerTitle: true,
      title: TextField(
        onChanged: (value) => log(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
           hintText: "Search ",
            prefixIcon: Icon(Icons.search),
            hintStyle: TextStyle(
              fontSize: 14,
              color: Color(0xFFBDBDBD),
            ),
          
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.camera_alt),
          onPressed: () {
            // Action lors du clic sur l'icône de l'appareil photo/vidéo
          },
        ),
        IconButton(
          icon: Icon(Icons.qr_code_scanner_outlined),
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
    );
  }
}