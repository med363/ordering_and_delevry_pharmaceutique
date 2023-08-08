import 'package:flutter/material.dart';

class MedicineListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: Replace this with the actual list of medicines in your app.
    final List<Map<String, dynamic>> medicines = [
      {'name': 'Stocke du pharmacie', 'icon': Icons.local_pharmacy},
      {'name': 'Liste de vente', 'icon': Icons.shopping_cart},
      {'name': 'Tester les medicament', 'icon': Icons.medical_services},
      {'name': 'Ajouter des medicament', 'icon': Icons.add_circle_outline},
      {'name': 'Modifier medicament', 'icon': Icons.edit},
      {'name': 'Supprimer des medicament', 'icon': Icons.delete},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Medicaments en vente'),
      ),
      body: ListView.builder(
        itemCount: medicines.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              // Handle the click event here.
              // For example, you can navigate to another screen or show a dialog.
              print('Clicked on ${medicines[index]['name']}');
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
