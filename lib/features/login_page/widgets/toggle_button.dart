// Author: Ching-Yu

import 'package:flutter/material.dart';

class ToggleButton extends StatelessWidget {
  final bool isPasswordLogin;
  final VoidCallback onToggle;
  final Color activeColor;

  const ToggleButton({
    super.key,
    required this.isPasswordLogin,
    required this.onToggle,
    this.activeColor = Colors.grey,
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
          style: TextStyle(color: activeColor),
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