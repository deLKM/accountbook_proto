// Author: Ching-Yu

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../common/widgets/proto_appbar.dart';
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
      appBar: ProtoAppBar(title: 'Transaction Detail'),
      body: CustomScrollView(
        slivers: [
          // 时间选择器（未完成）
          TimeSelector(monthData: monthData,),

          // 月统计
          MonthlySummary(monthData: monthData),
          
          // 当日细节应该是在一个新页面，这个页面默认展开，然后也可以下拉
          // 记得实现这个功能
          // 当日细节
          DailyList(dailyData: dailyData),
        ],
      ),
    );
  }
}