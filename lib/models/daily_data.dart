// Author: Ching-Yu

import 'transaction.dart';

class DailyData {
  final DateTime date;
  final List<Transaction> transactions;
  
  DailyData(this.date, this.transactions);
}