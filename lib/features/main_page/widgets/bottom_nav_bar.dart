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
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: Theme.of(context).primaryColor,
      selectedItemColor: Theme.of(context).primaryColorDark,
      unselectedItemColor: Theme.of(context).scaffoldBackgroundColor,
      iconSize: iconSize,
      selectedFontSize: fontSize,
      unselectedFontSize: fontSize,
      items: [
      _buildNavItem(context, Icons.home, 0, '明细'),
      _buildNavItem(context, Icons.list, 1, '计划'),
      _buildNavItem(context, Icons.pie_chart, 2, '统计'),
      _buildNavItem(context, Icons.person, 3, '我的'),
      ],
    );
  }

  BottomNavigationBarItem _buildNavItem(BuildContext context, IconData icon, int index, String label) {
    return BottomNavigationBarItem(
      icon: Icon(icon, size: iconSize),
      label: label,
      backgroundColor: currentIndex == index
        ? Theme.of(context).primaryColorDark
        : Theme.of(context).primaryColorDark,
    );
  }
}