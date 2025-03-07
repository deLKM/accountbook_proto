// Author: Ching-Yu

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/monthly_summary.dart';
import '../widgets/daily_list.dart';
import '../widgets/time_selector.dart';
import '../providers/txn_dtl_page_provider.dart';

class TxnDtlPage extends ConsumerWidget {
  const TxnDtlPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final monthData = ref.watch(monthSummaryProvider);
    final dailyData = ref.watch(dailyDataProvider);

    return Scaffold(
      appBar: AppBar(),
      body: CustomScrollView(
        slivers: [
          TimeSelector(monthData: monthData,),

          // 月统计
          MonthlySummary(monthData: monthData),

          // 当日细节
          DailyList(dailyData: dailyData),
        ],
      ),
    );
  }
}