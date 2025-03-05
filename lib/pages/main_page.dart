// Author: Ching-Yu


import 'account_page.dart';
import 'plan_page.dart';
import 'profile_page.dart';
import 'txn_dtl_page.dart';
import 'record_a_bill_page.dart';
import '../widgets/main_page/bottom_nav_bar.dart';
import '../widgets/main_page/fa_button.dart';
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
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex, 
        onTap: (index) => setState(() {
          _selectedIndex = index;
        })
      ),
      floatingActionButton: FAButton(context: context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

