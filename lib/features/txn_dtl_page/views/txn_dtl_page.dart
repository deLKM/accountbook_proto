// Author: Ching-Yu

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/monthly_summary.dart';
import '../widgets/time_selector.dart';
import '../widgets/assets_and_liabilities.dart';
import '../widgets/daily_list.dart';
import '../providers/txn_dtl_page_provider.dart';

class TxnDtlPage extends ConsumerWidget {
  const TxnDtlPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final monthData = ref.watch(monthSummaryProvider);
    
    // dailyData 由订阅 dailyDataProvider 获得
    final dailyData = ref.watch(dailyDataProvider);
    final assets = ref.watch(assetsProvider);
    final liabilities = ref.watch(liabilitiesProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Transaction Detail')),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              // 时间选择器（未完成）
              TimeSelector(monthData: monthData),

              // 月统计（未完成）
              MonthlySummary(monthData: monthData),

              // 资产与负债详记（未完成）
              AssetsAndLiabilities(
                totalAssets: assets,
                totalLiabilities: liabilities,
              ),
            ],
          ),
          // 每日交易列表（未完成）
          DailyListPage(dailyData: dailyData),
        ],
      ),
    );
  }
}
