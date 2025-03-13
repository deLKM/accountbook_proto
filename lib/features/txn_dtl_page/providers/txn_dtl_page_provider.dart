// Author: Ching-Yu

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hive/hive.dart';
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
@riverpod
List<DailyData> dailyData(ref) {
  final box = Hive.box<DailyData>('daily_data');

  // 获取所有 DailyData
  final dailyDataList = box.values.toList();

  // 如果没有数据，返回一个默认的 DailyData
  if (dailyDataList.isEmpty) {
    return [DailyData(DateTime.now(), [])];
  }

  return dailyDataList;
}

@riverpod
double assets(ref) {
  return 50000.0;
}

@riverpod
double liabilities(ref) {
  return 20000.0;
}