import 'package:flutter/material.dart';

class RepturePharmacyScreen extends StatelessWidget {
  final Map<String, dynamic> repture;

  RepturePharmacyScreen({required this.repture});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Repture du Stocke'),
      ),
      body: SingleChildScrollView(
        child: DataTable(
          columns: const <DataColumn>[
            DataColumn(
              label: Text(
                'Noms du médicament en ruptures',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 6, 19, 134),  // Change the text color to white
                ),
              ),
            ),
          ],
          rows: List<DataRow>.generate(
            repture['repture'].length,
            (index) => DataRow(
              cells: <DataCell>[
                DataCell(
                  Text(
                    '${repture['repture'][index]['Name_medicament'] ?? 'N/A'}',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.normal,
                      color: Color.fromARGB(255, 238, 43, 43), // Change the text color to white
                    ),
                  ),
                ),
               ],
            ),
          ),
        ),
      ),
    );
  }
}
