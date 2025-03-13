// Author: Ching-Yu

import 'package:hive/hive.dart';
import 'transaction.dart';
import 'daily_data.dart';

class DailyDataAdapter extends TypeAdapter<DailyData> {
  @override
  final int typeId = 2; 

  @override
  DailyData read(BinaryReader reader) {
    final date = DateTime.parse(reader.read());
    final transactions = (reader.read() as List).cast<Transaction>();
    return DailyData(date, transactions);
  }

  @override
  void write(BinaryWriter writer, DailyData obj) {
    writer.write(obj.date.toIso8601String());
    writer.write(obj.transactions);
  }
}