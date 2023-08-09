import 'package:flutter/material.dart';
import 'package:flutter_app/user/components/chat_pages/group_page.dart';
import 'package:flutter_app/user/screens/profile/profile_screen.dart';
import 'package:uuid/uuid.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key, required this.email, });

  final String email;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            onTap: () => Navigator.pushNamed(context, ProfileScreen.route()),
            child: const CircleAvatar(
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
                children:  [
                  const Text(
                    'Good Morning 👋',
                    style: TextStyle(
                      color: Color(0xFF757575),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 6),
                   Text(
                    email,
                    style: TextStyle(
                      color: Color(0xFF212121),
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
                  final uuid = Uuid(); // Create an instance of Uuid

            Navigator.push(context,
              MaterialPageRoute(
                builder: (context) =>  GroupPage(
                name:email, userId: uuid.v1(),
                )));
            },
          ),
        ],
      ),
    );
  }
}
const String kIconPath = 'assets/icons';
