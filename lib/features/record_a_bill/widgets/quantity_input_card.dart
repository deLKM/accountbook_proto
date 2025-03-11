// Author: Ching-Yu

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/expense_and_income_provider.dart';

class QuantityInputCard extends ConsumerWidget {
  final TextEditingController quantityController;

  const QuantityInputCard({
    super.key,
    required this.quantityController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedOptionLabel = ref.watch(selectedOptionLabelProvider);

    return Card(
      elevation: 4,
      margin: EdgeInsets.zero, 
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Enter quantity for $selectedOptionLabel',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: quantityController,
              readOnly: true, // 禁止手动输入
              decoration: InputDecoration(
                labelText: 'Quantity',
              ),
            ),
            const SizedBox(height: 5),
            _buildNumberPad(context), // 九宫格数字键盘
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    String quantity = quantityController.text;
                    if (quantity.isNotEmpty) {
                      // 处理数量（例如保存或显示）
                      ref.read(selectedOptionLabelProvider.notifier).state = null; 
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please enter a quantity')),
                      );
                    }
                  },
                  child: const Text('Confirm'),
                ),
                ElevatedButton(
                  onPressed: () {
                    ref.read(selectedOptionLabelProvider.notifier).state = null; 
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
      shrinkWrap: true, // 使 GridView 自适应内容大小
      crossAxisCount: 3, // 每行显示 3 个按钮
      childAspectRatio: 3, // 按钮的宽高比
      mainAxisSpacing: 8, // 垂直间距
      crossAxisSpacing: 8, // 水平间距
      padding: const EdgeInsets.all(8),
      children: [
        for (int i = 1; i <= 9; i++) // 数字 1-9
          _buildNumberButton(context, i.toString()),
        const SizedBox(), // 空占位符
        _buildNumberButton(context, '0'), // 数字 0
        _buildDeleteButton(), // 删除按钮
      ],
    );
  }

  Widget _buildNumberButton(BuildContext context, String number) {
    return TextButton(
      onPressed: () {
        quantityController.text += number; // 追加数字
      },
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(8), // 缩小按钮内边距
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
        if (quantityController.text.isNotEmpty) {
          quantityController.text = quantityController.text
              .substring(0, quantityController.text.length - 1); 
        }
      },
      icon: const Icon(Icons.backspace, size: 18), 
      style: IconButton.styleFrom(
        padding: const EdgeInsets.all(12),
      ),
    );
  }
}