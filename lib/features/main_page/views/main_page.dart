// Author: Ching-Yu

import '../../account_page/views/account_page.dart';
import '../../plan_page/views/plan_page.dart';
import '../../profile_page/views/profile_page.dart';
import '../../txn_dtl_page/views/txn_dtl_page.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/fa_button.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    TxnDtlPage(),
    PlanPage(),
    AccountPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FAButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}