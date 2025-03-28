// Author: Ching-Yu

import '../models/daily_data.dart';
import 'transaction_item.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class DailyItem extends StatelessWidget {
  const DailyItem({
    super.key,
    required this.daily,
  });

  final DailyData daily;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 16, 8),
          child: Text(
            DateFormat('M/d').format(daily.date),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        ...daily.transactions.map((transaction) => TransactionItem(transaction: transaction)),
      ],
    );
  }
}