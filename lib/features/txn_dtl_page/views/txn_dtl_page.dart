// Author: Ching-Yu

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../common/widgets/proto_appbar.dart';
import '../widgets/monthly_summary.dart';
import '../widgets/daily_list.dart';
import '../widgets/time_selector.dart';
import '../widgets/assets_and_liabilities.dart';
import '../providers/txn_dtl_page_provider.dart';

class TxnDtlPage extends ConsumerWidget {
  const TxnDtlPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final monthData = ref.watch(monthSummaryProvider);
    final dailyData = ref.watch(dailyDataProvider);

    final assets = 0.0;
    final liabilities = 0.0;

    return Scaffold(
      appBar: ProtoAppBar(title: 'Transaction Detail'),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              // 时间选择器（未完成）
              TimeSelector(monthData: monthData),

              // 月统计
              MonthlySummary(monthData: monthData),

              // 资产与负债详记（未完成）
              AssetsAndLiabilities(
                totalAssets: assets,
                totalLiabilities: liabilities,
              ),
            ],
          ),

          // DailyListPage(dailyData: dailyData),
        ],
      ),
    );
  }
}
