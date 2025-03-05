// Author: Ching-Yu

import '../widgets/common/proto_appbar.dart';
import '../widgets/txn_dtl_page/monthly_summary.dart';
import '../widgets/txn_dtl_page/daily_list.dart';
import '../models/daily_data.dart';
import '../models/month_summary.dart';
import 'package:flutter/material.dart';

class TxnDtlPage extends StatelessWidget {
  final MonthSummary monthData;
  final List<DailyData> dailyData;

  TxnDtlPage({
    super.key,
    MonthSummary? monthData,
    List<DailyData>? dailyData,
  }) : 
    monthData = monthData ?? _generateDefaultMonthSummary(),
    dailyData = dailyData ?? _generateDefaultDailyData();

  static MonthSummary _generateDefaultMonthSummary() {
    final now = DateTime.now();
    return MonthSummary(
      DateTime(now.year, now.month),
      0,
      0,
    );
  }

  static List<DailyData> _generateDefaultDailyData() {
    return [
      DailyData(
        DateTime.now(), 
        [],
        )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProtoAppBar(
        title: '${monthData.month.year}/${monthData.month.month}'
      ),
      body: CustomScrollView(
        slivers: [
          // 月统计
          MonthlySummary(monthData: monthData),
          // 当日细节
          DailyList(dailyData: dailyData),
        ],
      ),
    );
  }
}
