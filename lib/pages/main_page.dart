// Author: Ching-Yu

import 'package:accountbook_proto/pages/account_page.dart';
import 'package:accountbook_proto/pages/plan_page.dart';
import 'package:accountbook_proto/pages/profile_page.dart';
import 'package:accountbook_proto/pages/txn_dtl_page.dart';
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

    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: theme.primaryColor,
      notchMargin: 3.0,
      height: 65,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavItem(Icons.home, 0),
          _buildNavItem(Icons.list, 1),
          _buildNavItem(Icons.paste_rounded, 2),
          _buildNavItem(Icons.person, 3),
        ],
      ),
    );
  }

  Widget _buildNavItem(icon, int? index) {
    final theme = Theme.of(context);

    return IconButton(
      icon: Icon(icon, size: 20),
      color:
          _selectedIndex == index
              ? theme.primaryColorDark
              : theme.scaffoldBackgroundColor,
      onPressed: () => _onItemTapped(index),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      enableFeedback: false,
      padding: EdgeInsets.zero, // Add this line to reduce the padding
      constraints: const BoxConstraints(),
      alignment: Alignment.bottomCenter,
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
      onPressed: () {},

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
