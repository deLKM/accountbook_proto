// Author: Ching-Yu

class Ebit {
  final double amount;
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