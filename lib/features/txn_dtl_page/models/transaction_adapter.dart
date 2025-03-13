// Author: Ching-Yu

import 'package:hive/hive.dart';
import 'transaction.dart';

class TransactionAdapter extends TypeAdapter<Transaction> {
  @override
  final int typeId = 0; 

  @override
  Transaction read(BinaryReader reader) {
    final json = reader.readMap();
    final Map<String, dynamic> jsonMap = json.cast<String, dynamic>();
    return Transaction.fromJson(jsonMap);
  }

  @override
  void write(BinaryWriter writer, Transaction obj) {
    writer.writeMap(obj.toJson());
  }
}