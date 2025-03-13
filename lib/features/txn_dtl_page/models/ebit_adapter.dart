// Author: Ching-Yu

import 'package:hive/hive.dart';
import 'ebit.dart';

class EbitAdapter extends TypeAdapter<Ebit> {
  @override
  final int typeId = 1; 

  @override
  Ebit read(BinaryReader reader) {
    final json = reader.readMap();
    final Map<String, dynamic> jsonMap = json.cast<String, dynamic>();
    return Ebit.fromJson(jsonMap);
  }

  @override
  void write(BinaryWriter writer, Ebit obj) {
    writer.writeMap(obj.toJson());
  }
}