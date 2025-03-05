// Author: Ching-Yu

import 'account_page.dart';
import 'plan_page.dart';
import 'profile_page.dart';
import 'txn_dtl_page.dart';
import 'record_a_bill_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = [
    TxnDtlPage(),
    PlanPage(),
    AccountPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: _buildBottomNavBar(),
      floatingActionButton: _buildFAButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildBottomNavBar() {
    final theme = Theme.of(context);

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: theme.primaryColor,
      selectedItemColor: theme.primaryColorDark,
      unselectedItemColor: theme.scaffoldBackgroundColor,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      iconSize: 20,
      selectedIconTheme: IconThemeData(size: 20),
      unselectedIconTheme: IconThemeData(size: 20),
      selectedFontSize: 8, 
      unselectedFontSize: 8,
      items: [
      _buildNavItem(Icons.home, 0, 'HOME'),
      _buildNavItem(Icons.list, 1, 'Plan'),
      _buildNavItem(Icons.paste_rounded, 2, 'ACCOUNT'),
      _buildNavItem(Icons.person, 3, 'PROFILE'),
      ],
    );
  }

  BottomNavigationBarItem _buildNavItem(IconData icon, int index, String label) {
    final theme = Theme.of(context);

    return BottomNavigationBarItem(
      icon: Icon(icon, size: 20),
      label: label,
      backgroundColor: _selectedIndex == index
        ? theme.primaryColorDark
        : theme.scaffoldBackgroundColor,
    );
  }

  void _onItemTapped(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildFAButton() {
    final theme = Theme.of(context);

    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) => RecordPage(),
        );
      },

      backgroundColor: theme.scaffoldBackgroundColor,
      elevation: 0,
      splashColor: Colors.transparent,
      enableFeedback: false,
      highlightElevation: 0,
      foregroundColor: theme.primaryColor,
      hoverColor: theme.primaryColorLight,
      hoverElevation: 0,
      shape: CircleBorder(),
      child: const Icon(Icons.add),
    );
  }
}
