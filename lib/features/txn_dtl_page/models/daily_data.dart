import 'transaction.dart';

class DailyData {
  final DateTime date;
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