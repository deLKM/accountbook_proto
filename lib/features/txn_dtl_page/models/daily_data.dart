// Author: Ching-Yu

import 'package:hive_flutter/hive_flutter.dart';
import 'transaction.dart';

@HiveType(typeId: 2)
class DailyData {
  @HiveField(0)
  final DateTime date;

  // 每日的所有的 Transaction 的列表
  @HiveField(1)
  final List<Transaction> transactions;

  DailyData(this.date, this.transactions);

  // 计算当天收入
  double get dailyIncome => transactions
      .where((t) => t.isIncome)
      .fold(0, (sum, t) => sum + t.amount);

  // 计算当天支出
  double get dailyExpense => transactions
      .where((t) => !t.isIncome)
      .fold(0, (sum, t) => sum + t.amount);
}