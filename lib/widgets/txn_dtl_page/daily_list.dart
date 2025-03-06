// Author: Ching-Yu

import 'package:flutter/material.dart';
import '../../models/txn/daily_data.dart';
import 'daily_item.dart';

class DailyList extends StatelessWidget {
  const DailyList({
    super.key,
    required this.dailyData,
  });

  final List<DailyData> dailyData;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final daily = dailyData[index];
          return DailyItem(daily: daily);
        },
        childCount: dailyData.length,
      ),
    );
  }
}