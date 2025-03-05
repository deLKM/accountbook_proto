// Author: Ching-Yu

import 'package:flutter/material.dart';
import '../widgets/profile_header.dart';
import 'login_page.dart'; // Import the login page

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isLoggedIn = false; // Add a variable to track login status

  void updateLoginStatus(bool status) {
    setState(() {
      isLoggedIn = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: () async {
                        if (!isLoggedIn) {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                          if (result == true) {
                            updateLoginStatus(true);
                          }
                        }
                      },
                      child: ProfileHeader(
                        avatarUrl: '',
                        username: 'DefaultUser',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}