// Author: Ching-Yu

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'app/app.dart';
import 'package:flutter/material.dart';
import 'features/txn_dtl_page/models/transaction.dart';
import 'features/txn_dtl_page/models/transaction_adapter.dart';
import 'features/txn_dtl_page/models/ebit_adapter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TransactionAdapter()); 
  Hive.registerAdapter(EbitAdapter());
  await Hive.openBox<Transaction>('transactions'); 

  runApp(ProviderScope(child: MyApp()));
}