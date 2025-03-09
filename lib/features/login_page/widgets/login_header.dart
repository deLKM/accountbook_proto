// Author: Ching-Yu

import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.account_balance_wallet,
          size: 50,
          color: Theme.of(context).primaryColor,
        ),
        const SizedBox(height: 0),
      ],
    );
  }
}