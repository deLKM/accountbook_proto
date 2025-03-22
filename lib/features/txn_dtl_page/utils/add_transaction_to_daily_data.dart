// ignore_for_file: unused_result
// Author: Ching-Yu

import 'package:hive/hive.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/txn_dtl_page_provider.dart';
import '../models/transaction.dart';
import '../models/daily_data.dart';

void addTransactionToDailyData(WidgetRef ref, Transaction transaction) async {
  final box = Hive.box<DailyData>('daily_data');

  // 调试用，确认 Hive Box 是否开启
  print('Box opened: ${box.isOpen}');
  
  final date = DateTime.parse(transaction.timestamp).toLocal();
  final key = DateTime(date.year, date.month, date.day).toIso8601String();

  // 获取当天的 DailyData
  DailyData? dailyData = box.get(key);

  if (dailyData == null) {
    dailyData = DailyData(date, [transaction]);
  } else {
    dailyData.transactions.add(transaction);
  }

  // 调试信息
  print('Transaction saved in DailyData: ${transaction.displayId}');

  await box.put(key, dailyData);

  ref.refresh(dailyDataProvider);
}