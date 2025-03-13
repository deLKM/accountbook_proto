// Author: Ching-Yu

import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class Ebit {
  @HiveField(0)
  final double amount;

  @HiveField(1)
  final String account;

  Ebit({
    required this.amount,
    required this.account,
  });

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'account': account,
    };
  }

  static Ebit fromJson(Map<String, dynamic> json) {
    return Ebit(
      amount: json['amount'],
      account: json['account'],
    );
  }
}