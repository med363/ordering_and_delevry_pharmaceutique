import 'package:flutter/material.dart';
import 'package:flutter_app/Pharmacien/screens/profile/profile_screen.dart';
import 'package:flutter_app/user/components/chat_pages/group_page.dart';
import 'medicine_list_screen.dart'; // Import the newly created medicine_list_screen.dart
import 'package:uuid/uuid.dart';

class HomeAppBar extends StatelessWidget {
 final String username;
var uuid= Uuid();
  HomeAppBar({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            onTap: () =>
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(username: username),
                ),
              ),
            child: const CircleAvatar(
              backgroundImage: AssetImage('$kIconPath/me1.jpg'),
              radius: 24,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  Text(
                    'Good Morning Chère/Cher pharmacien(ne)👋',
                    style: TextStyle(
                      color: Color(0xFF757575),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                      username, 
                      style: TextStyle(
                      color: Color.fromARGB(255, 14, 164, 119),
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                //  SizedBox(height:6),
                //   Text(
                //     username, 
                //     style: TextStyle(
                //       color: Color.fromARGB(255, 37, 103, 17),
                //       fontWeight: FontWeight.bold,
                //     ),
                //     textAlign: TextAlign.start,
                //   ),
                ],
              ),
            ),
          ),
          IconButton(
            iconSize: 28,
            icon: Image.asset('$kIconPath/light/notification.png'),
            onPressed: () {},
          ),
          const SizedBox(width: 16),
          IconButton(
            iconSize: 28,
            icon: Image.asset('$kIconPath/light/chat.png'),
                        onPressed: () {
                  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GroupPage(userId: uuid.v1(), username: username,), // Replace with the appropriate GroupPage widget
      ),
    );
            },
          ),
          const SizedBox(width: 16),
          IconButton(
            iconSize: 28,
            icon: Image.asset('$kIconPath/light/coeur1.png'),
            onPressed: () {
              // Navigate to the MedicineListScreen when the heart icon is tapped.
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MedicineListScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
const String kIconPath = 'assets/icons';