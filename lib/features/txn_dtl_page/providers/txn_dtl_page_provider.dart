// Author: Ching-Yu

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/daily_data.dart';
import '../models/month_summary.dart';

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

final monthSummaryProvider = StateProvider<MonthSummary>((ref) {
  final now = DateTime.now();
  final currentMonth = DateTime(now.year, now.month);
  
  final dailyDataList = ref.read(dailyDataProvider)    
      .where((dailyData) =>
        dailyData.date.year == currentMonth.year &&
        dailyData.date.month == currentMonth.month)
    .toList();

  return generateMonthSummary(dailyDataList, DateTime(now.year, now.month));
});

// Provides a list of daily data, starting with the current date.
final dailyDataProvider = StateProvider<List<DailyData>>((ref) {
  // 请求API
  return [DailyData(DateTime.now(), [])];
});
