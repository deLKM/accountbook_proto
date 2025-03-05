// Author: Ching-Yu

import 'package:flutter/material.dart';
import '../widgets/profile_header.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
                    child: ProfileHeader(
                      avatarUrl: 'https://i.pravatar.cc/150',
                      username: 'FlutterMaster',
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