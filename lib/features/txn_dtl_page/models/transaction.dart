// Author: Ching-Yu

import 'ebit.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Transaction {
  @HiveField(0)
  final String? internalId;

  @HiveField(1)
  final String displayId;

  @HiveField(2)
  final String timestamp;

  @HiveField(3)
  final Ebit debit;

  @HiveField(4)
  final Ebit credit;

  // abstract 显然是一个保留关键字
  @HiveField(5)
  final String? abstra;

  @HiveField(6)
  final bool isIncome;

  Transaction({
    this.internalId,
    required this.displayId,
    required this.timestamp,
    required this.debit,
    required this.credit,
    required this.abstra,
    required this.isIncome,
  });

  // 一些需要的属性的供给
  double get amount => isIncome ? credit.amount : debit.amount;

  DateTime get time => DateTime.parse(timestamp);

  // 将 Transaction 转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'internalId': internalId,
      'displayId': displayId,
      'timestamp': timestamp,
      'debit': debit.toJson(),
      'credit': credit.toJson(),
      'abstract': abstra,
      'isIncome': isIncome,
    };
  }

  // 从 JSON 创建 Transaction
  static Transaction fromJson(Map<String, dynamic> json) {
    return Transaction(
      internalId: json['internalId'],
      displayId: json['displayId'],
      timestamp: json['timestamp'],
      debit: Ebit.fromJson(json['debit']),
      credit: Ebit.fromJson(json['credit']),
      abstra: json['abstract'],
      isIncome: json['isIncome'],
    );
  }
}
