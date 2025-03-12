// Author: Ching-Yu

class Ebit {
  final double amount;

  Ebit({required this.amount});

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
    };
  }

  static Ebit fromJson(Map<String, dynamic> json) {
    return Ebit(
      amount: json['amount'],
    );
  }
}