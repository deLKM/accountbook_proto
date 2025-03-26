// Author: Ching-Yu

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/expense_and_income_provider.dart';
import '../widgets/price_input_card.dart';

class IncomeTab extends ConsumerWidget {

  IncomeTab({
    super.key,
  });

  final TextEditingController quantityController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedOptionLabel = ref.watch(selectedOptionLabelProvider);
    final priceController = ref.watch(priceControllerProvider);

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [],
          ),
          if (selectedOptionLabel != null) 
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: PriceInputCard(
                priceController: priceController,
                isIncome: true,
              ),
            ),
        ],
      ),
    );
  }
}