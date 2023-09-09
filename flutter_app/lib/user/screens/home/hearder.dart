import 'package:flutter/material.dart';
import 'package:flutter_app/user/components/chat_pages/group_page.dart';
import 'package:flutter_app/user/screens/profile/profile_screen.dart';
import 'package:uuid/uuid.dart';

class HomeAppBar extends StatelessWidget {
  final String username;
  var uuid=Uuid();
  HomeAppBar({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(username: username),
                ),
              );
            },child: const CircleAvatar(
              backgroundImage: AssetImage('$kIconPath/me.png'),
              radius: 24,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Good Morning Chère/Cher patient(te)👋',
                    style: TextStyle(
                      color: Color(0xFF757575),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    username, // Utilisez simplement "username" ici
                    style: TextStyle(
                      color: Color.fromARGB(255, 38, 114, 177),
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
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
            icon: Image.asset('$kIconPath/light/coeur.png'),
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
        ],
      ),
    );
  }
}

const String kIconPath = 'assets/icons';