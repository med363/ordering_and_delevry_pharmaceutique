import 'package:flutter/material.dart';

class VenteOptionsPage extends StatelessWidget {
  final Map<String, dynamic> achat;

  VenteOptionsPage({required this.achat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listes du vente'),
      ),
      body: SingleChildScrollView(
        child: DataTable(
          columns: const <DataColumn>[
            DataColumn(
              label: Text(
                'Noms',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(
                      255, 6, 19, 134), // Change the text color to white
                ),
              ),
            ),
            DataColumn(
              label: Text(
                'Type',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(
                      255, 6, 19, 134), // Change the text color to white
                ),
              ),
            ),
            DataColumn(
              label: Text(
                'Nbre',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(
                      255, 6, 19, 134), // Change the text color to white
                ),
              ),
            ),
            DataColumn(
              label: Text(
                'Prix',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(
                      255, 6, 19, 134), // Change the text color to white
                ),
              ),
            ),
            DataColumn(
              label: Text(
                'Patient(e)',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(
                      255, 6, 19, 134), // Change the text color to white
                ),
              ),
            ),
            DataColumn(
              label: Text(
                'Ordonnance',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(
                      255, 6, 19, 134), // Change the text color to white
                ),
              ),
            ),
          ],
          rows: List<DataRow>.generate(
            achat['achat'].length,
            (index) => DataRow(
              cells: <DataCell>[
                DataCell(
                  Text(
                    '${achat['achat'][index]['noms'] ?? 'N/A'}',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.normal,
                      color: Color.fromARGB(167, 43, 166, 238), // Change the text color to white
                    ),
                  ),
                ),
             
               DataCell(
                  Text(
                    '${achat['achat'][index]['type'] ?? 'N/A'}',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.normal,
                      color: Color.fromARGB(167, 43, 166, 238), // Change the text color to white
                    ),
                  ),
                ),
             
               DataCell(
                  Text(
                    '${achat['achat'][index]['Number'] ?? 'N/A'}',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.normal,
                      color: Color.fromARGB(167, 43, 166, 238), // Change the text color to white
                    ),
                  ),
                ),
             
               DataCell(
                  Text(
                    '${achat['achat'][index]['prix'] ?? 'N/A'}',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.normal,
                      color: Color.fromARGB(167, 43, 166, 238), // Change the text color to white
                    ),
                  ),
                ),
                 DataCell(
                  Text(
                    '${achat['achat'][index]['patient'] ?? 'indefini'}',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.normal,
                      color: Color.fromARGB(167, 43, 166, 238), // Change the text color to white
                    ),
                  ),
                ),
             
                 DataCell(
                  Text(
                    '${achat['achat'][index]['ordonnance'] ?? 'N/A'}',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.normal,
                      color: Color.fromARGB(167, 43, 166, 238), // Change the text color to white
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