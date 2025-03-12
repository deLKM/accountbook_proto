import 'package:flutter/material.dart';
import '../widgets/assets_and_liabilities_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ManageLiabilitiesPage extends ConsumerWidget {
  const ManageLiabilitiesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Manage Liabilities')),
      body: Column(
        children: [
          // 还没调整好
          AALButton(
            onPressed: () {},
            labeltext: 'Cash',
          ),
          const SizedBox(height: 30),

          AALButton(
            onPressed: () {},
            labeltext: 'Virtual Account',
          ),
          const SizedBox(height: 30),

          AALButton(
            onPressed: () {},
            labeltext: 'Savings Card',
          ),
          const SizedBox(height: 30),

          AALButton(
            onPressed: () {},
            labeltext: 'Creditor\'s Rights',
          ),
          const SizedBox(height: 30),

          AALButton(
            onPressed: () {},
            labeltext: 'Financial Account',
          ), 
          const SizedBox(height: 30),
 
          AALButton(
            onPressed: () {},
            labeltext: 'Other Assets',
          ),
        ],
      ),
    );
  }
}