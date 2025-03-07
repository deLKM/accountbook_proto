// Author: Ching-Yu

class Transaction {
  final String id;
  final String title;
  final double amount;
  final bool isIncome;
  final DateTime time;
  
  Transaction(this.id, this.title, this.amount, this.isIncome, this.time);

  List<Transaction> filterTransactions(List<Transaction> transactions, bool isIncome) {
    return transactions.where((t) => t.isIncome == isIncome).toList();
  }
}