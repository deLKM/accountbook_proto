// Author: Ching-Yu

import 'package:flutter/material.dart';

class HelperButtons extends StatelessWidget {
  const HelperButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/signup'); // 跳转注册页面
          },
          style: TextButton.styleFrom(
            foregroundColor: Theme.of(context).primaryColor,
          ),
          child: Text(
            '注册',
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/forgotpwd');
          }, // 跳转忘记密码
          style: TextButton.styleFrom(
            foregroundColor: Theme.of(context).primaryColor,
          ),
          child: const Text('忘记你的密码？'),
        ),
      ],
    );
  }
}