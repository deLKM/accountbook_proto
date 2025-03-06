// Author: Ching-Yu

import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final double iconSize;
  final double fontSize;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    this.iconSize = 20,
    this.fontSize = 8,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: theme.primaryColor,
      selectedItemColor: theme.primaryColorDark,
      unselectedItemColor: theme.scaffoldBackgroundColor,
      iconSize: iconSize,
      selectedFontSize: fontSize,
      unselectedFontSize: fontSize,
      items: [
      _buildNavItem(context, Icons.home, 0, 'HOME'),
      _buildNavItem(context, Icons.list, 1, 'Plan'),
      _buildNavItem(context, Icons.paste_rounded, 2, 'ACCOUNT'),
      _buildNavItem(context, Icons.person, 3, 'PROFILE'),
      ],
    );
  }

  BottomNavigationBarItem _buildNavItem(BuildContext context, IconData icon, int index, String label) {
    final theme = Theme.of(context);

    return BottomNavigationBarItem(
      icon: Icon(icon, size: iconSize),
      label: label,
      backgroundColor: currentIndex == index
        ? theme.primaryColorDark
        : theme.scaffoldBackgroundColor,
    );
  }
}