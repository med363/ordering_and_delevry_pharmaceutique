import 'dart:developer';

import 'package:flutter/material.dart';

class Category {
  const Category(this.icon, this.title, this.id);

  final String icon;
  final String title;
  final String id;
}

final homeCategories = <Category>[
  const Category('assets/icons/med.png', 'Medecin', 'medecin'),
  const Category('assets/icons/pharmacie.png', 'Pharmacie', 'pharmacie'),
  const Category('assets/icons/medicament.png', 'Medicament', 'medicament'),
  const Category('assets/icons/question.png', 'Question', 'question'),
  const Category('assets/icons/magasine.png', 'Magazine', 'magazine'),
  const Category('assets/icons/category_others@2x.png', 'Others', 'other'),
];

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
     
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      centerTitle: true,
      actions: [
        // Wrap the SingleChildScrollView and SearchField in a Row
        Row(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: homeCategories.map((category) {
                  return InkWell(
                    onTap: () {
                      // Handle the category selection here
                      log('Selected category: ${category.title}');
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      child: Row(
                        children: [
                          Image.asset(
                            category.icon,
                            width: 24,
                            height: 24,
                          ),
                          SizedBox(width: 10),
                          Text(
                            category.title,
                            style: TextStyle(
                              color: Colors.black, // Set the text color to black
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            // Add the search bar TextField here
          ],
        ),
      ],
    );
  }
}
