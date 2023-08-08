import 'package:flutter/material.dart';

class HomePage_User extends StatelessWidget {
  // Add a GlobalKey for the Scaffold
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Assign the GlobalKey to the Scaffold
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 43, 51, 118),
        title: Text('Accueil'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Ouvrir le tiroir lorsqu'on clique sur l'icône du menu
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CustomMenuDialog();
                },
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.chat),
            onPressed: () {
              // Action lors du clic sur l'icône du chat
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              ListTile(
                dense: true,
                title: Text("Home Page"),
                leading: Icon(Icons.home),
                onTap: () {
                  // Action when "Home Page" menu is pressed
                  // Add your desired action here
                  Navigator.pop(context); // Close the drawer
                },
              ),
              ListTile(
                dense: true,
                title: Text("My Profile"),
                leading: Icon(Icons.person),
                onTap: () {
                  // Action when "My Profile" menu is pressed
                  // Add your desired action here
                  Navigator.pop(context); // Close the drawer
                },
              ),
              ListTile(
                dense: true,
                title: Text("My Orders"),
                leading: Icon(Icons.add_box),
                onTap: () {
                  // Acti.on when "My Orders" menu is pressed
                  // Add your desired action here
                  Navigator.pop(context); // Close the drawer
                },
              ),
              ListTile(
                dense: true,
                title: Text("My Favourites"),
                leading: Icon(Icons.monitor_heart),
                onTap: () {
                  // Action when "My Favourites" menu is pressed
                  // Add your desired action here
                  Navigator.pop(context); // Close the drawer
                },
              ),
              ListTile(
                dense: true,
                title: Text("My Chat"),
                leading: Icon(Icons.chat_bubble), // Icon for My Chat
                onTap: () {
                  // Action when "My Chat" menu is pressed
                  // Add your desired action here
                  Navigator.pop(context); // Close the drawer
                },
              ),
              ListTile(
                dense: true,
                title: Text("Question"),
                leading: Icon(Icons.help), // Icon for Question
                onTap: () {
                  // Action when "Question" menu is pressed
                  // Add your desired action here
                  Navigator.pop(context); // Close the drawer
                },
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
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
                ),
                hintText: 'Rechercher des médicaments...',
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: listeMedicaments.length,
              itemBuilder: (context, index) {
                return MedicamentCard(
                  image: listeMedicaments[index]['image'],
                  nom: listeMedicaments[index]['nom'],
                  prix: listeMedicaments[index]['prix'],
                  localisation: listeMedicaments[index]['localisation'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MedicamentCard extends StatelessWidget {
  final String image;
  final String nom;
  final String prix;
  final String localisation;

  MedicamentCard({
    required this.image,
    required this.nom,
    required this.prix,
    required this.localisation,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(
          'assets/images/$image',
          errorBuilder: (context, error, stackTrace) {
            return Icon(Icons.error); // Placeholder image or error icon
          },
        ),
        title: Text(nom),
        subtitle: Row(
          children: [
            Icon(Icons.attach_money), // Icon for prix
            SizedBox(width: 5),
            Text(prix),
            SizedBox(width: 15),
            Icon(Icons.location_on), // Icon for localisation
            SizedBox(width: 5),
            Text(localisation),
          ],
        ),
        onTap: () {
          // Action lors du clic sur une carte de médicament
        },
      ),
    );
  }
}

class CustomMenuDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Welcom 😃'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profil'),
            onTap: () {
              // Action lorsque l'utilisateur clique sur Profil
              Navigator.pop(context); // Ferme le dialogue après la sélection
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Paramètres'),
            onTap: () {
              // Action lorsque l'utilisateur clique sur Paramètres
              Navigator.pop(context); // Ferme le dialogue après la sélection
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Déconnexion'),
            onTap: () {
              // Action lorsque l'utilisateur clique sur Déconnexion
              Navigator.pop(context); // Ferme le dialogue après la sélection
              // Ajoutez ici le code pour effectuer la déconnexion
            },
          ),
        ],
      ),
    );
  }
}

// Exemple de liste de médicaments (vous pouvez remplacer cela par vos propres données)
List<Map<String, dynamic>> listeMedicaments = [
  {
    'image': '8.jpg',
    'nom': 'Médicament 1',
    'prix': '20 \$',
    'localisation': 'Pharmacie A',
  },
  {
    'image': '9.jpg',
    'nom': 'Médicament 2',
    'prix': '15 \$',
    'localisation': 'Pharmacie B',
  },
  {
    'image': '10.webp',
    'nom': 'Médicament 2',
    'prix': '15 \$',
    'localisation': 'Pharmacie C',
  },
  // Ajoutez d'autres médicaments ici
];
