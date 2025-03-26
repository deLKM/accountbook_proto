// Author: Ching-Yu

import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final String avatarUrl;
  final String username;

  const ProfileHeader({
    super.key, 
    required this.avatarUrl, 
    required this.username, 
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Avatar
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 3),
          ),
          child: CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(avatarUrl),
            backgroundColor: Theme.of(context).primaryColorLight,
          ),
        ),
        SizedBox(height: 16),
        
        // Username
        Text(
          username,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
      ],
    );
  }
}