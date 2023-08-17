import 'package:flutter/material.dart';
import '../../../config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'RepturePharmacyScreen.dart';
import 'StockePharmacyScreen.dart';
import 'Vente_liste.dart';
class MedicineListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: Replace this with the actual list of medicines in your app.
    final List<Map<String, dynamic>> medicines = [
      {'name': 'Stocke du pharmacie', 'icon': Icons.local_pharmacy},
      {'name': 'Listes des ventes', 'icon': Icons.shopping_cart},
      {'name': 'Listes des Reptures', 'icon': Icons.read_more},
      {'name': 'Tester les medicament', 'icon': Icons.medical_services},
      {'name': 'Ajouter des medicament', 'icon': Icons.add_circle_outline},
      {'name': 'Liste medicament', 'icon': Icons.edit},
     // {'name': 'Supprimer des medicament', 'icon': Icons.delete},
    ];
    //stocke
Future<void> _showStockePharmacy(BuildContext context) async {
    final response = await http.get(Uri.parse(all_stocks));
  
    if (response.statusCode == 200) {
      Map<String, dynamic> stock = jsonDecode(response.body);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => StockePharmacyScreen(stock:stock),
        ),
      );
    } else {
      // Handle error
      print('Failed to fetch stock from the server.');
    }
  }

//repture
Future<void>_showRepturePharmacy(BuildContext context) async {
    final response = await http.get(Uri.parse(all_repture));
  
    if (response.statusCode == 200) {
      Map<String, dynamic> repture = jsonDecode(response.body);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RepturePharmacyScreen(repture:repture),
        ),
      );
    } else {
      // Handle error
      print('Failed to fetch stock from the server.');
    }
  }
//vente
Future<void> showVenteOptions(BuildContext context) async {
   final response = await http.get(Uri.parse(all_achat));
  
    if (response.statusCode == 200) {
      Map<String, dynamic> achat = jsonDecode(response.body);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VenteOptionsPage(achat:achat),
        ),
      );
    } else {
      // Handle error
      print('Failed to fetch stock from the server.');
    }
  }
 
 return Scaffold(
      appBar: AppBar(
        title: Text('Medicaments en vente'),
      ),
      body: ListView.builder(
        itemCount: medicines.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              if (medicines[index]['name'] == 'Stocke du pharmacie') {
                _showStockePharmacy(context);
              } else if (medicines[index]['name'] == 'Listes des Reptures') {
                _showRepturePharmacy(context);
              } else if (medicines[index]['name'] == 'Listes des ventes') {
              showVenteOptions(context);
              } 
              
               else {
                print('Clicked on ${medicines[index]['name']}');
              }
            },
            child: ListTile(
              leading: Icon(medicines[index]['icon']),
              title: Text(medicines[index]['name']),
              // Add other details about the medicine here if needed.
            ),
          );
        },
      ),
    );
  }
}



