import '../widgets/assets_and_liabilities_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ManageAssetsPage extends ConsumerWidget {
  const ManageAssetsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Manage Assets')),
      body: Column(
        children: [
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
