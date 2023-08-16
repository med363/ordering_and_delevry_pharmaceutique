// import 'package:flutter/material.dart';

// class HomePage_User extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
        
//         backgroundColor:
//             Color.fromARGB(255, 43, 51, 118), // Utilise la couleur spécifiée
//         title: Text('Accueil'),
//         leading: IconButton(
//           icon: Icon(Icons.menu), // Icône du menu
//           onPressed: () {
//             // Action lors du clic sur l'icône du menu
//           },
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.account_circle), // Icône du compte
//             onPressed: () {
//               // Action lors du clic sur l'icône du compte
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.chat), // Icône du chat
//             onPressed: () {
//               // Action lors du clic sur l'icône du chat
//             },
//           ),
//         ],
//       ),
      
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               decoration: InputDecoration(
//                 prefixIcon: Icon(Icons.search),
//                 suffixIcon: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     IconButton(
//                       icon: Icon(Icons.camera_alt),
//                       onPressed: () {
//                         // Action lors du clic sur l'icône de l'appareil photo/vidéo
//                       },
//                     ),
//                     IconButton(
//                       icon: Icon(Icons.mic),
//                       onPressed: () {
//                         // Action lors du clic sur l'icône de la voix
//                       },
//                     ),
//                   ],
//                 ),
//                 hintText: 'Rechercher des médicaments...',
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: listeMedicaments.length,
//               itemBuilder: (context, index) {
//                 return MedicamentCard(
//                   image: listeMedicaments[index]['image'],
//                   nom: listeMedicaments[index]['nom'],
//                   prix: listeMedicaments[index]['prix'],
//                   localisation: listeMedicaments[index]['localisation'],
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class MedicamentCard extends StatelessWidget {
//   final String image;
//   final String nom;
//   final String prix;
//   final String localisation;

//   MedicamentCard({
//     required this.image,
//     required this.nom,
//     required this.prix,
//     required this.localisation,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: ListTile(
//         leading: Image.asset(
//           'assets/images/$image',
//           errorBuilder: (context, error, stackTrace) {
//             return Icon(Icons.error); // Placeholder image or error icon
//           },
//         ),
//         title: Text(nom),
//         subtitle: Row(
//           children: [
//             Icon(Icons.attach_money), // Icon for prix
//             SizedBox(width: 5),
//             Text(prix),
//             SizedBox(width: 15),
//             Icon(Icons.location_on), // Icon for localisation
//             SizedBox(width: 5),
//             Text(localisation),
//           ],
//         ),
//         onTap: () {
//           // Action lors du clic sur une carte de médicament
//         },
//       ),
//     );
//   }
// }

// // Exemple de liste de médicaments (vous pouvez remplacer cela par vos propres données)
// List<Map<String, dynamic>> listeMedicaments = [
//   {
//     'image': '8.jpg',
//     'nom': 'Médicament 1',
//     'prix': '20 \$',
//     'localisation': 'Pharmacie A',
//   },
//   {
//     'image': '9.jpg',
//     'nom': 'Médicament 2',
//     'prix': '15 \$',
//     'localisation': 'Pharmacie B',
//   },
//   {
//     'image': '10.webp',
//     'nom': 'Médicament 2',
//     'prix': '15 \$',
//     'localisation': 'Pharmacie C',
//   },
//   {
//     'image': '9.jpg',
//     'nom': 'Médicament 2',
//     'prix': '15 \$',
//     'localisation': 'Pharmacie D',
//   },
//   // Ajoutez d'autres médicaments ici
// ];
