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
    final theme = Theme.of(context);

    return Column(
      children: [
        Icon(
          Icons.account_balance_wallet,
          size: 50,
          color: theme.primaryColor,
        ),
        const SizedBox(height: 0),
      ],
    );
  }
}