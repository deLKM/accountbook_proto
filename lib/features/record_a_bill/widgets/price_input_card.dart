// Author: Ching-Yu

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../txn_dtl_page/models/transaction.dart';
import '../../txn_dtl_page/models/ebit.dart';
import '../providers/expense_and_income_provider.dart';

class PriceInputCard extends ConsumerWidget {
  final TextEditingController priceController;
  final bool isIncome;

  const PriceInputCard({
    super.key,
    required this.priceController,
    required this.isIncome,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 输入框右对齐，宽度为父容器的一半
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: TextFormField(
                    controller: priceController,
                    readOnly: true,
                    textAlign: TextAlign.right,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(right: 20),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            _buildNumberPad(context),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    String price = priceController.text;
                    if (price.isNotEmpty) {
                      // 创建新的 Transaction 对象
                      final transaction = Transaction(
                        internalId: '',
                        displayId:
                            'TXN-${DateTime.now().millisecondsSinceEpoch}',
                        timestamp: DateTime.now().toIso8601String(),
                        debit: isIncome
                            ? Ebit(amount: 0, account: '')
                            : Ebit(
                                amount: double.parse(price), account: ''),
                        credit: isIncome
                            ? Ebit(amount: double.parse(price), account: '')
                            : Ebit(amount: 0, account: ''),
                        abstra: isIncome ? 'Income' : 'Expense',
                        isIncome: isIncome,
                      );

                      // 将 Transaction 存储到 Hive 中
                      final box = Hive.box<Transaction>('transactions');
                      // 调试用，确认 Hive Box 是否开启
                      print('Box opened: ${box.isOpen}');

                      await box.add(transaction);
                      // 调试用，确认 Transaction 是否正确存储进 Hive Box
                      print('Transaction saved: ${transaction.displayId}');
                      // 清除选中的选项标签
                      ref
                          .read(selectedOptionLabelProvider.notifier)
                          .updateLabel(null);

                      // 清除价格输入
                      priceController.clear();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('请输入金额')),
                      );
                    }
                  },
                  child: const Text('Confirm'),
                ),
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(selectedOptionLabelProvider.notifier)
                        .updateLabel(null);
                  },
                  child: const Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNumberPad(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      childAspectRatio: 3,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      padding: const EdgeInsets.all(8),
      children: [
        for (int i = 1; i <= 9; i++) _buildNumberButton(context, i.toString()),
        _buildNumberButton(context, '.'),
        _buildNumberButton(context, '0'),
        _buildDeleteButton(),
      ],
    );
  }

  Widget _buildNumberButton(BuildContext context, String number) {
    return TextButton(
      onPressed: () {
        priceController.text += number;
      },
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        number,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget _buildDeleteButton() {
    return IconButton(
      onPressed: () {
        if (priceController.text.isNotEmpty) {
          priceController.text = priceController.text
              .substring(0, priceController.text.length - 1);
        }
      },
      icon: const Icon(Icons.backspace, size: 18),
      style: IconButton.styleFrom(
        padding: const EdgeInsets.all(12),
      ),
    );
  }
}
