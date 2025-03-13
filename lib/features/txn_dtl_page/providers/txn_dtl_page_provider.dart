// Author: Ching-Yu

import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/daily_data.dart';
import '../models/month_summary.dart';

part 'txn_dtl_page_provider.g.dart';

MonthSummary generateMonthSummary(
  List<DailyData> dailyDataList,
  DateTime month,
) {
  double income = 0;
  double expense = 0;
  for (var dailyData in dailyDataList) {
    income += dailyData.dailyIncome;
    expense += dailyData.dailyExpense;
  }
  return MonthSummary(month, income, expense);
}

@riverpod
MonthSummary monthSummary(ref) {
  final now = DateTime.now();
  final currentMonth = DateTime(now.year, now.month);
  
  final dailyDataList = ref.read(dailyDataProvider)    
      .where((dailyData) =>
        dailyData.date.year == currentMonth.year &&
        dailyData.date.month == currentMonth.month)
    .toList();

  return generateMonthSummary(dailyDataList, DateTime(now.year, now.month));
}

// Provides a list of daily data, starting with the current date.
// 显然这里还没有做完......
@riverpod
List<DailyData> dailyData(ref) {
  // 请求本地存储
  return [DailyData(DateTime.now(), [])];
}

@riverpod
double assets(ref) {
  return 50000.0;
}

@riverpod
double liabilities(ref) {
  return 20000.0;
}