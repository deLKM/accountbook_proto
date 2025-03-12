// Author: Ching-Yu

import 'ebit.dart';

class Transaction {
  final String internalId;
  final String displayId;
  final String timestamp;
  final Ebit debit;
  final Ebit credit;
  final String title;
  final bool isIncome;
  
  Transaction({
    required this.internalId, 
    required this.displayId,
    required this.timestamp,
    required this.debit,
    required this.credit,
    required this.title, 
    required this.isIncome, 
  });

  // 一些需要的属性的供给
  double get amount => isIncome ? credit.amount : debit.amount;

  DateTime get time => DateTime.parse(timestamp);
}

class TransactionUtils {
  static List<Transaction> filterTransactions(List<Transaction> transactions, bool isIncome) {
    return transactions.where((t) => t.isIncome == isIncome).toList();
  }
}