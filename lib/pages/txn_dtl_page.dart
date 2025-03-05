// Author: Ching-Yu

import 'package:accountbook_proto/widgets/common/proto_appbar.dart';
import 'package:flutter/material.dart';
import '../models/daily_data.dart';
import 'package:intl/intl.dart';
import '../models/month_summary.dart';
import '../models/transaction.dart';

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
          _buildMonthSummary(),

          // 当日细节
          // _buildDailyList(),
        ],
      ),
    );
  }

  Widget _buildMonthSummary() {
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
              _buildStatItem("Balance", monthData.income - monthData.expense, Colors.black),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, double value, Color color) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value.toStringAsFixed(2),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

//   Widget _buildDailyList() {
//   return SliverList(
//     delegate: SliverChildBuilderDelegate(
//       (context, index) {
//         final daily = dailyData[index];
//         return _buildDailyItem(daily);
//       },
//       childCount: dailyData.length,
//     ),
//   );
// }

  // Widget _buildDailyItem(DailyData daily) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       // 日期标题
  //       Padding(
  //         padding: const EdgeInsets.fromLTRB(20, 20, 16, 8),
  //         child: Text(
  //           DateFormat('M/d').format(daily.date),
  //           style: const TextStyle(
  //             fontWeight: FontWeight.bold,
  //             fontSize: 16,
  //           ),
  //         ),
  //       ),
  //       // 当日交易列表
  //       ...daily.transactions.map((transaction) => _buildTransactionItem(transaction)),
  //     ],
  //   );
  // }

  // Widget _buildTransactionItem(Transaction transaction) {
  //   return ListTile(
  //     leading: CircleAvatar(
  //       backgroundColor: transaction.isIncome ? Colors.green[100] : Colors.red[100],
  //       child: Icon(
  //         transaction.isIncome ? Icons.arrow_upward : Icons.arrow_downward,
  //         color: transaction.isIncome ? Colors.green : Colors.red,
  //       ),
  //     ),
  //     title: Text(transaction.title),
  //     subtitle: Text(DateFormat('HH:mm').format(transaction.time)),
  //     trailing: Text(
  //       '${transaction.isIncome ? '+' : '-'}¥${transaction.amount.toStringAsFixed(2)}',
  //       style: TextStyle(
  //         color: transaction.isIncome ? Colors.green : Colors.red,
  //         fontWeight: FontWeight.bold,
  //       ),
  //     ),
  //   );
  // }
}