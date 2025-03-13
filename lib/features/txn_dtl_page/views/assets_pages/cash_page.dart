// Author: Ching-Yu
// 还没写完，有关 Account 的数据处理没有想出来该怎么办

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/account_provider.dart';
import '../../models/transaction.dart';
import '../../models/ebit.dart';
import '../../utils/add_transaction_to_daily_data.dart';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';

class CashPage extends ConsumerWidget {
  CashPage({super.key});

  final TextEditingController _balanceController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountNotifier = ref.read(accountNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Account')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                const Text('Title:', style: TextStyle(fontSize: 16)),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      accountNotifier.updateTitle(value);
                    },
                  ),
                ),
              ],
            ),
            const Divider(),
            const SizedBox(height: 16),

            // 输入 Subtitle
            Row(
              children: [
                const Text('Subtitle:', style: TextStyle(fontSize: 16)),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      accountNotifier.updateSubtitle(value);
                    },
                  ),
                ),
              ],
            ),
            const Divider(),
            const SizedBox(height: 16),

            // 输入 Balance
            Row(
              children: [
                const Text('Balance:', style: TextStyle(fontSize: 16)),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: _balanceController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                // 添加保存按钮
                IconButton(
                  icon: const Icon(Icons.save),
                  onPressed: () async {
                    if (_balanceController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('请输入金额')),
                      );
                      return;
                    }

                    // 创建 Transaction 对象
                    final transaction = Transaction(
                      internalId: '',
                      displayId: 'TXN-${DateTime.now().millisecondsSinceEpoch}',
                      timestamp: DateTime.now().toIso8601String(),
                      debit: Ebit(amount: 0, account: 'cash'),
                      credit: Ebit(
                        amount: double.parse(_balanceController.text),
                        account: 'current_account',
                      ),
                      abstra: 'Balance',
                      isIncome: true,
                    );

                    // 存储到 Hive
                    final box = Hive.box<Transaction>('transactions');
                    await box.add(transaction);

                    // 添加每日数据
                    addTransactionToDailyData(ref, transaction);

                    // 清空输入
                    _balanceController.clear();
                  },
                ),
              ],
            ),
            const Divider(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
