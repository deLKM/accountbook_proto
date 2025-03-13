// Author: Ching-Yu

import 'package:hive/hive.dart';
import 'account.dart';

class AccountAdapter extends TypeAdapter<Account> {
  @override
  final int typeId = 3; 

  @override
  Account read(BinaryReader reader) {
    return Account(
      internalId: reader.read(),    // @HiveField(0)
      displayId: reader.read(),     // @HiveField(1)
      title: reader.read(),         // @HiveField(2)
      subtitle: reader.read(),      // @HiveField(3)
      subOf: reader.read(),         // @HiveField(4)
      deleted: reader.read(),       // @HiveField(5)
    );
  }

  @override
  void write(BinaryWriter writer, Account obj) {
    writer.write(obj.internalId);
    writer.write(obj.displayId);
    writer.write(obj.title);
    writer.write(obj.subtitle);
    writer.write(obj.subOf);
    writer.write(obj.deleted);
  }
}