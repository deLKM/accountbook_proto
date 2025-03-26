// Author: Ching-Yu
// 还没写完，有关 Account 的数据处理没有想出来该怎么办

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/transaction.dart';
import '../../models/ebit.dart';
import '../../models/account.dart';
import '../../utils/add_transaction_to_daily_data.dart';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';

class CashPage extends ConsumerWidget {
  CashPage({super.key});

  final TextEditingController _balanceController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _subtitleController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('现金')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 输入标题
            Row(
              children: [
                Text(
                  '账户名：', 
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // 输入副标题
            Row(
              children: [
                Text(
                  '账户备注：', 
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: _subtitleController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // 输入余额
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Text(
                      '账户余额：', 
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
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
                  ],
                ),
                const SizedBox(height: 30),
                
                // 保存按钮
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_titleController.text.isEmpty || 
                          _subtitleController.text.isEmpty || 
                          _balanceController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('请将所有信息填写完整')),
                        );
                        return;
                      }

                      // 创建 Account 对象
                      final account = Account(
                        displayId: 'ACC-${DateTime.now().millisecondsSinceEpoch}',
                        title: _titleController.text,
                        subtitle: _subtitleController.text,
                        subOf: '',
                        deleted: false,
                        isSelected: false,
                      );
                      print('Creating Account object');

                      // 存储
                      final accountBox = Hive.box<Account>('accounts');
                      await accountBox.add(account);

                      // 创建 Transaction 记录
                      print('Creating Transaction object');
                      final transaction = Transaction(
                        displayId: 'TXN-${DateTime.now().millisecondsSinceEpoch}',
                        timestamp: DateTime.now().toIso8601String(),
                        debit: Ebit(
                          amount: 0, 
                          account: ''
                        ),
                        credit: Ebit(
                          amount: double.parse(_balanceController.text),
                          account: account.internalId ?? '',
                        ),
                        abstra: 'Balance',
                        isIncome: true,
                      );

                      // 存储
                      final box = Hive.box<Transaction>('transactions');
                      await box.add(transaction);   

                      // 添加每日数据
                      print('Adding transaction to daily data');
                      addTransactionToDailyData(ref, transaction);

                      // 清空输入
                      _titleController.clear();
                      _subtitleController.clear();
                      _balanceController.clear();
                    }, 
                    child: Text('保存'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}