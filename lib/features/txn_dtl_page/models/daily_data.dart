// Author: Ching-Yu

import 'transaction.dart';

class DailyData {
  final DateTime date;
  final List<Transaction> transactions;
  
  DailyData(this.date, this.transactions);

  double get dailyIncome => transactions.where((t) => t.isIncome).fold(0, (sum, t) => sum + t.amount);
  double get dailyExpense => transactions.where((t) => !t.isIncome).fold(0, (sum, t) => sum + t.amount);
}

