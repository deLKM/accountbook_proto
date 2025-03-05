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
          onPressed: () {}, // 跳转注册页面
          child: const Text('Sign Up'),
        ),
        TextButton(
          onPressed: () {}, // 跳转忘记密码
          child: const Text('Forgot your Password?'),
        ),
      ],
    );
  }
}