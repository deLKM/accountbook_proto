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
          // 信用卡
          AALButton(
            onPressed: () => Navigator.pushNamed(context, '/credit_cards'),
            labeltext: 'Credit Cards',
          ),
          const SizedBox(height: 30),

          // 网贷
          AALButton(
            onPressed: () => Navigator.pushNamed(context, '/online_loans'),
            labeltext: 'Online Loans',
          ),
          const SizedBox(height: 30),

          // 债务
          AALButton(
            onPressed: () => Navigator.pushNamed(context, '/debts'),
            labeltext: 'Debts',
          ),
          const SizedBox(height: 30),

          // 其他负债
          AALButton(
            onPressed: () => Navigator.pushNamed(context, '/other_liabilities'),
            labeltext: 'Other Liabilities',
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}