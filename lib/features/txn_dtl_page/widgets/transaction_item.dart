// Author: Ching-Yu

import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
    required this.transaction,
  });

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: transaction.isIncome ? Colors.green[100] : Colors.red[100],
        child: Icon(
          transaction.isIncome ? Icons.arrow_upward : Icons.arrow_downward,
          color: transaction.isIncome ? Colors.green : Colors.red,
        ),
      ),
      title: Text(transaction.title),
      subtitle: Text(DateFormat('HH:mm').format(transaction.time)),
      trailing: Text(
        '${transaction.isIncome ? '+' : '-'}¥${transaction.amount.toStringAsFixed(2)}',
        style: TextStyle(
          color: transaction.isIncome ? Colors.green : Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}