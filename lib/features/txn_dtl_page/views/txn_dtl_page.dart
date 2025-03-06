// Author: Ching-Yu

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../login_page/widgets/proto_appbar.dart';
import '../widgets/monthly_summary.dart';
import '../widgets/daily_list.dart';
import '../providers/txn_dtl_page_provider.dart';

class TxnDtlPage extends ConsumerWidget {
  const TxnDtlPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final monthData = ref.watch(monthSummaryProvider);
    final dailyData = ref.watch(dailyDataProvider);

    return Scaffold(
      appBar: ProtoAppBar(
        title: '${monthData.month.year}/${monthData.month.month}',
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