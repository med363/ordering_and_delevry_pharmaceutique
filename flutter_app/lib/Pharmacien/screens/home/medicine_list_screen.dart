import 'package:flutter/material.dart';
import 'package:flutter_app/Pharmacien/screens/home/list_medication_page.dart';
import 'add_medication_page.dart'; // Import your AddMedicationPage

class MedicineListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> medicines = [
      {'name': 'Stocke du pharmacie', 'icon': Icons.local_pharmacy},
      {'name': 'Tester les medicament', 'icon': Icons.medical_services},
      {'name': 'Ajouter des medicament', 'icon': Icons.add_circle_outline},
      {'name': 'Liste des medicament', 'icon': Icons.list},
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
              if (index == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddMedicationPage(),
                  ),
                );
              } else if (index == 3) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListMedicalPage(),
                  ),
                );
              } else {
                // Handle other click events here if needed.
                print('Clicked on ${medicines[index]['name']}');
              }
            },
            child: ListTile(
              leading: Icon(medicines[index]['icon']),
              title: Text(medicines[index]['name']),
            ),
          );
        },
      ),
    );
  }
}
