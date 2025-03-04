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
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
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
      notchMargin: 6.0,
      height: 88,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.home, size: 28),
            color: _selectedIndex == 0 ? theme.primaryColorDark : theme.scaffoldBackgroundColor,
            onPressed: () => _onItemTapped(0),
          ),
          Text(
            'Home', 
            style: TextStyle(color: _selectedIndex == 0 
              ? theme.primaryColorDark 
              : theme.scaffoldBackgroundColor
            )
          ),
        ],
          ),
          Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.list, size: 28),
            color: _selectedIndex == 1 ? theme.primaryColorDark : theme.scaffoldBackgroundColor,
            onPressed: () => _onItemTapped(1),
          ),
          Text(
            'Plan', 
            style: TextStyle(color: _selectedIndex == 1 
              ? theme.primaryColorDark 
              : theme.scaffoldBackgroundColor
            )
          ),
        ],
          ),
          const SizedBox(width: 48), // 中间空出的位置给FloatingActionButton
          Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.pie_chart, size: 28),
            color: _selectedIndex == 2 ? theme.primaryColorDark : theme.scaffoldBackgroundColor,
            onPressed: () => _onItemTapped(2),
          ),
          Text(
            'Account', 
            style: TextStyle(color: _selectedIndex == 2 
              ? theme.primaryColorDark 
              : theme.scaffoldBackgroundColor
            )
          ),
        ],
          ),
          Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.person, size: 28),
            color: _selectedIndex == 3 ? theme.primaryColorDark : theme.scaffoldBackgroundColor,
            onPressed: () => _onItemTapped(3),
          ),
          Text(
            'Profile', 
            style: TextStyle(color: _selectedIndex == 3 
            ? theme.primaryColorDark 
            : theme.scaffoldBackgroundColor
            )
          ),
        ],
          ),
        ],
      ),
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

      },
      backgroundColor: theme.scaffoldBackgroundColor,
      elevation: 0,
      splashColor: theme.primaryColor,
      foregroundColor: theme.primaryColor,
      hoverColor: theme.primaryColorLight,
      shape: CircleBorder(),
      child: const Icon(Icons.add),
    );
  }
}