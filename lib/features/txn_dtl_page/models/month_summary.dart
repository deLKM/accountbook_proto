// Author: Ching-Yu

import 'daily_data.dart';

class MonthSummary {
  final DateTime month;
  final double income;
  final double expense;
  
  MonthSummary(this.month, this.income, this.expense);

  MonthSummary generateMonthSummary(List<DailyData> dailyDataList, DateTime month) {
    double income = 0;
    double expense = 0;
    for (var dailyData in dailyDataList) {
      income += dailyData.dailyIncome;
      expense += dailyData.dailyExpense;
    }
    return MonthSummary(month, income, expense);
  }
}