import 'package:flutter/material.dart';
import '../widgets/food_options.dart';

class ExpenseTab extends StatefulWidget {
  const ExpenseTab({super.key});

  @override
  State<ExpenseTab> createState() => _ExpenseTabState();
}

class _ExpenseTabState extends State<ExpenseTab> {
  String? selectedOptionLabel; // 当前选中的选项标签
  TextEditingController quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              FoodOptions(
                title: 'Basic',
                foodOptions: [
                  {'icon': Icons.breakfast_dining, 'label': 'Breakfast'},
                  {'icon': Icons.lunch_dining, 'label': 'Lunch'},
                  {'icon': Icons.dinner_dining, 'label': 'Dinner'},
                  {'icon': Icons.food_bank, 'label': 'Snacks'},
                ],
                onOptionSelected: (label) {
                  setState(() {
                    selectedOptionLabel = label; // 设置当前选中的选项
                    quantityController.clear(); // 清空输入框
                  });
                },
              ),
              const Divider(),
              FoodOptions(
                title: 'Transport',
                foodOptions: [
                  {'icon': Icons.local_taxi, 'label': 'Taxi'},
                  {'icon': Icons.subway, 'label': 'Subway'},
                  {'icon': Icons.bus_alert_outlined, 'label': 'Bus'},
                  {'icon': Icons.emoji_transportation, 'label': 'Others'},
                ],
                onOptionSelected: (label) {
                  setState(() {
                    selectedOptionLabel = label; // 设置当前选中的选项
                    quantityController.clear(); // 清空输入框
                  });
                },
              ),
              const Divider(),
            ],
          ),
          if (selectedOptionLabel != null) // 显示弹出组件
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _buildQuantityInputCard(),
            ),
        ],
      ),
    );
  }

  Widget _buildQuantityInputCard() {
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
            _buildNumberPad(), // 九宫格数字键盘
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    String quantity = quantityController.text;
                    if (quantity.isNotEmpty) {
                      // 处理数量（例如保存或显示）
                      setState(() {
                        selectedOptionLabel = null; // 关闭弹出组件
                      });
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
                    setState(() {
                      selectedOptionLabel = null; // 关闭弹出组件
                    });
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

  Widget _buildNumberPad() {
    return GridView.count(
      shrinkWrap: true, // 使 GridView 自适应内容大小
      crossAxisCount: 3, // 每行显示 3 个按钮
      childAspectRatio: 3, // 按钮的宽高比
      mainAxisSpacing: 8, // 垂直间距
      crossAxisSpacing: 8, // 水平间距
      padding: const EdgeInsets.all(8),
      children: [
        for (int i = 1; i <= 9; i++) // 数字 1-9
          _buildNumberButton(i.toString()),
        const SizedBox(), // 空占位符
        _buildNumberButton('0'), // 数字 0
        _buildDeleteButton(), // 删除按钮
      ],
    );
  }

  Widget _buildNumberButton(String number) {
    return TextButton(
      onPressed: () {
        setState(() {
          quantityController.text += number; // 追加数字
        });
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
        setState(() {
          if (quantityController.text.isNotEmpty) {
            quantityController.text = quantityController.text
                .substring(0, quantityController.text.length - 1); 
          }
        });
      },
      icon: const Icon(Icons.backspace, size: 18), 
      style: IconButton.styleFrom(
        padding: const EdgeInsets.all(12),
      ),
    );
  }
}