// Author: Ching-Yu

import 'package:flutter/material.dart';

class ToggleButton extends StatelessWidget {
  final bool isPasswordLogin;
  final VoidCallback onToggle;

  const ToggleButton({
    super.key,
    required this.isPasswordLogin,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final activeText = isPasswordLogin ? 'SMS Login' : 'Password Login';
    final buttonText = isPasswordLogin 
        ? 'Switch to SMS Login' 
        : 'Switch to Password Login';

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          activeText,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(width: 8),
        TextButton(
          onPressed: onToggle,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
          ),
          child: Text(
            buttonText,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}