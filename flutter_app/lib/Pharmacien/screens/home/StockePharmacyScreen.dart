import 'package:flutter/material.dart';

class StockePharmacyScreen extends StatelessWidget {
  final Map<String, dynamic> stock;

  StockePharmacyScreen({required this.stock});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stocke du pharmacie'),
      ),
      body: SingleChildScrollView(
        child: DataTable(
          columns: const <DataColumn>[
            DataColumn(
              label: Text(
                'Name_stocke',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 6, 19, 134),  // Change the text color to white
                ),
              ),
            ),
            DataColumn(
              label: Text(
                'Quantite_stocke',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 6, 19, 134), // Change the text color to white
                ),
              ),
            ),
          ],
          rows: List<DataRow>.generate(
            stock['stocks'].length,
            (index) => DataRow(
              cells: <DataCell>[
                DataCell(
                  Text(
                    '${stock['stocks'][index]['Name_stocke'] ?? 'N/A'}',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight:FontWeight.normal,
                      color: Color.fromARGB(255, 95, 165, 205), // Change the text color to white
                    ),
                  ),
                ),
                DataCell(
                  Text(
                    '${stock['stocks'][index]['quantite_stocke'] ?? 'N/A'}',
                    style: TextStyle(
                      fontSize:19,
                      fontWeight: FontWeight.normal,
                      color:Color.fromARGB(255, 95, 165, 205), // Change the text color to white
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
