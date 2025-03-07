// Author: Ching-Yu

import 'package:flutter/material.dart';
import 'income.dart' as income;
import 'outcome.dart' as outcome;
import 'transfer.dart' as transfer;

class RecordPage extends StatefulWidget {
  const RecordPage({super.key});

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> with TickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _tabs = [
    'Income', 
    'Outcome', 
    'Transfer'
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Record'),
        bottom: TabBar(
          controller: _tabController,
          tabs: _tabs.map((tab) => Tab(text: tab)).toList(),
          indicatorColor: theme.primaryColor,
          labelStyle: TextStyle(
            fontSize: 16, 
            color: theme.primaryColor,
            fontWeight: FontWeight.bold
          ),
          unselectedLabelStyle: TextStyle(fontSize: 14),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          income.IncomeTab(),
          outcome.OutcomeTab(),
          transfer.TransferTab(),
        ],
      ),
    );
  }
}