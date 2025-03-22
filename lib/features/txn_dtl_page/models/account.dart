// Author: Ching-Yu

import 'package:hive/hive.dart';

@HiveType(typeId: 3)
class Account {
  @HiveField(0)
  final String? internalId;

  @HiveField(1)
  final String displayId;

  @HiveField(2)
  final String title;

  @HiveField(3)
  final String subtitle;

  @HiveField(4)
  final String subOf;

  @HiveField(5)
  final bool? deleted;

  Account({
    this.internalId,
    required this.displayId,
    required this.title,
    required this.subtitle,
    required this.subOf,
    this.deleted = false,
  });

  Account copyWith({
    String? internalId,
    String? displayId,
    String? title,
    String? subtitle,
    String? subOf,
    bool? deleted,
  }) {
    return Account(
      internalId: internalId ?? this.internalId,
      displayId: displayId ?? this.displayId,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      subOf: subOf ?? this.subOf,
      deleted: deleted ?? this.deleted,
    );
  }
}