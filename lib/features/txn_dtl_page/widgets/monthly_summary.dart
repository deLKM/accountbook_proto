// Author: Ching-Yu

import 'package:flutter/material.dart';
import '../models/month_summary.dart';
import 'stat_item.dart';

class MonthlySummary extends StatelessWidget {
  const MonthlySummary({
    super.key,
    required this.monthData,
  });

  final MonthSummary monthData;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Card(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            children: [
              StatItem(
                label: 'Balance',
                labelColor: Theme.of(context).primaryColor,
                value: monthData.income - monthData.expense,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}