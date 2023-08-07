import 'package:flutter/material.dart';

class VenteOptionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Options de vente'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4.0,
          child: buildVenteOptionsTable(),
          color: Color.fromARGB(255, 139, 232, 131),
        ),
      ),
    );
  }

  Widget buildVenteOptionsTable() {
    List<Map<String, dynamic>> venteOptions = [
      {
        'nom': 'Option 1',
        'prix': 10.0,
        'quantite': 5,
        'nomUtilisateur': 'Utilisateur 1',
        'ordonnance': 'Oui',
      },
      {
        'nom': 'Option 2',
        'prix': 15.0,
        'quantite': 3,
        'nomUtilisateur': 'Utilisateur 2',
        'ordonnance': 'Non',
      },
      // Ajoutez d'autres éléments de données ici
    ];

    return DataTable(
      columnSpacing: 50.0,
      horizontalMargin: 20.0,
      headingRowHeight: 50.0,
      dataRowHeight: 60.0,
      
      columns: [
        DataColumn(
          label: Text(
            'Nom',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        DataColumn(
          label: Text(
            'Prix',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        DataColumn(
          label: Text(
            'Quantité',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        DataColumn(
          label: Text(
            'Nom Utilisateur',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        DataColumn(
          label: Text(
            'Ordonnance',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ],
      rows: venteOptions.map(
        (option) {
          return DataRow(cells: [
            DataCell(
              Container(
                width: 80,
                child: Text(option['nom']),
              ),
            ),
            DataCell(Text(
              option['prix'].toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              option['quantite'].toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            DataCell(
              Container(
                width: 120,
                child: Text(
                  option['nomUtilisateur'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            DataCell(Text(
              option['ordonnance'],
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
          ]);
        },
      ).toList(),
    );
  }
}
