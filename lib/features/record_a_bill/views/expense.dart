// Author: Ching-Yu

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/expense_and_income_provider.dart';
import '../widgets/quantity_input_card.dart';
import '../widgets/food_options.dart';

class ExpenseTab extends ConsumerWidget {

  ExpenseTab({
    super.key,
  });

  final TextEditingController quantityController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedOptionLabel = ref.watch(selectedOptionLabelProvider);
    final quantityController = ref.watch(quantityControllerProvider);

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
                  ref.read(selectedOptionLabelProvider.notifier).state = label; 
                  quantityController.clear(); // 清空输入框
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
                  ref.read(selectedOptionLabelProvider.notifier).state = label; // 更新状态
                  quantityController.clear(); // 清空输入框
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
              child: QuantityInputCard(
                quantityController: quantityController,
              ),
            ),
        ],
      ),
    );
  }
}