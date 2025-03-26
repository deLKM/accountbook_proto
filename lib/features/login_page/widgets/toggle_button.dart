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
    final activeText = isPasswordLogin ? '短信验证登录' : '账号密码登录';
    final buttonText = isPasswordLogin 
        ? '切换至短信验证登录' 
        : '切换至账号密码登录';

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