// Author: Ching-Yu

import 'package:accountbook_proto/features/txn_dtl_page/models/daily_data.dart';
import 'package:accountbook_proto/features/txn_dtl_page/models/daily_data_adapter.dart';
import 'package:accountbook_proto/features/txn_dtl_page/models/ebit.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'app/app.dart';
import 'package:flutter/material.dart';
import 'features/txn_dtl_page/models/transaction.dart';
import 'features/txn_dtl_page/models/transaction_adapter.dart';
import 'features/txn_dtl_page/models/ebit_adapter.dart';
import 'features/txn_dtl_page/models/account.dart';
import 'features/txn_dtl_page/models/account_adapter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TransactionAdapter()); 
  Hive.registerAdapter(EbitAdapter());
  Hive.registerAdapter(DailyDataAdapter());
  Hive.registerAdapter(AccountAdapter());
  await Hive.openBox<Transaction>('transactions'); 
  await Hive.openBox<DailyData>('daily_data'); 
  await Hive.openBox<Ebit>('ebit'); 
  await Hive.openBox<Account>('account');

  runApp(ProviderScope(child: MyApp()));
}