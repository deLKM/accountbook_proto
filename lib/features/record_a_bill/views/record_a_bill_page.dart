// Author: Ching-Yu

import 'package:flutter/material.dart';
import 'income.dart' as income;
import 'expense.dart' as expense;
import 'transfer.dart' as transfer;

class RecordPage extends StatefulWidget {
  const RecordPage({super.key});

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> with TickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _tabs = ['支出', '收入', '互转'];

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
                top: Radius.circular(25),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '记录一笔流水',
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          TabBar(
            controller: _tabController,
            tabs: _tabs.map((tab) => Tab(text: tab)).toList(),
            indicatorColor: Theme.of(context).primaryColor,
            labelStyle: Theme.of(context).textTheme.titleMedium,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                expense.ExpenseTab(),
                income.IncomeTab(),
                transfer.TransferTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
