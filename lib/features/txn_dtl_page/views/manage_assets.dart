// Author: Ching-Yu

import '../widgets/assets_and_liabilities_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ManageAssetsPage extends ConsumerWidget {
  const ManageAssetsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('管理资产')),
      body: Column(
        children: [
          // 现金
          AALButton(
            onPressed: () => Navigator.pushNamed(context, '/cash'),
            labeltext: '现金',
          ),
          const SizedBox(height: 30),

          // 虚拟账户
          AALButton(
            onPressed: () => Navigator.pushNamed(context, '/virtual_accounts'),
            labeltext: '虚拟账户',
          ),
          const SizedBox(height: 30),

          // 储蓄卡
          AALButton(
            onPressed: () => Navigator.pushNamed(context, '/saving_cards'),
            labeltext: '储蓄卡',
          ),
          const SizedBox(height: 30),

          // 债权
          AALButton(
            onPressed: () => Navigator.pushNamed(context, '/creditors_rights'),
            labeltext: '股权',
          ),
          const SizedBox(height: 30),

          // 理财账户
          AALButton(
            onPressed: () => Navigator.pushNamed(context, '/financial_accounts'),
            labeltext: '金融账户',
          ), 
          const SizedBox(height: 30),
 
          // 其他资产
          AALButton(
            onPressed: () => Navigator.pushNamed(context, '/other_assets'),
            labeltext: '其他资产',
          ),
        ],
      ),
    );
  }
}
