// Author: Ching-Yu

import 'package:flutter/material.dart';
import '../../models/month_summary.dart';
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
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            children: [
              StatItem(label: "Balance", value: monthData.income - monthData.expense, color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }
}