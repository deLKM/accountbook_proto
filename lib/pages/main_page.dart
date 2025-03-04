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
      notchMargin: 6.0,
      height: 95,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavItem('Home'),
          _buildNavItem('Plan'),
          const SizedBox(width: 48), // 中间空出的位置给FloatingActionButton
          _buildNavItem('Account'),
          _buildNavItem('Profile'),
        ],
      ),
    );
  }

  Widget _buildNavItem(String? name) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(Icons.list, size: 23),
          color:
              _selectedIndex == 1
                  ? theme.primaryColorDark
                  : theme.scaffoldBackgroundColor,
          onPressed: () => _onItemTapped(1),
        ),
        Text(
          name.toString(),
          style: TextStyle(
            color:
                _selectedIndex == 1
                    ? theme.primaryColorDark
                    : theme.scaffoldBackgroundColor,
          ),
        ),
      ],
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
      splashColor: theme.primaryColor,
      foregroundColor: theme.primaryColor,
      hoverColor: theme.primaryColorLight,
      shape: CircleBorder(),
      child: const Icon(Icons.add),
    );
  }
}