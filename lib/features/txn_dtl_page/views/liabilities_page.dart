// Author: Ching-Yu

import 'package:flutter/material.dart';
import '../providers/txn_dtl_page_provider.dart';
import '../widgets/add_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LiabilitiesPage extends ConsumerWidget {
  const LiabilitiesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final liabilities = ref.watch(liabilitiesProvider);

    return Scaffold(
      appBar: AppBar(title: Text('负债')),
      body: Card(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '负债',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    liabilities.toStringAsFixed(2),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              Divider(),
              const SizedBox(height: 40),
              AddButton(
                text: '添加负债',
                onPressed: () => Navigator.pushNamed(context, '/manage_liabilities')
              ),
            ],
          ),
        ),
      ),
    );
  }
}
