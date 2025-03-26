// Author: Ching-Yu

import 'package:flutter/material.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Expanded(child: Divider()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text('其他登录方式'),
            ),
            Expanded(child: Divider()),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton.outlined(
              iconSize: 25,
              onPressed: () {}, // 微信登录
              icon: const Icon(Icons.wechat_rounded),
            ),
            IconButton.outlined(
              iconSize: 25,
              onPressed: () {}, // QQ登录
              icon: const Icon(Icons.quick_contacts_dialer_rounded),
            ),
          ],
        ),
      ],
    );
  }
}