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
  final List<String> _tabs = ['Income', 'Outcome', 'Transfer'];

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

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: Column(
        children: [
          Container(
            height: kToolbarHeight,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(25), // 顶部圆角
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Record',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          TabBar(
            controller: _tabController,
            tabs: _tabs.map((tab) => Tab(text: tab)).toList(),
            indicatorColor: theme.primaryColor,
            labelStyle: TextStyle(
              fontSize: 16,
              color: theme.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                income.IncomeTab(),
                outcome.OutcomeTab(),
                transfer.TransferTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
