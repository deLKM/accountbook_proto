// Author: Ching-Yu

import 'package:flutter/material.dart';
import '../providers/txn_dtl_page_provider.dart';
import '../widgets/add_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AssetsPage extends ConsumerWidget {
  const AssetsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assets = ref.watch(assetsProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Assets')),
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
                  Text('Assets', style: Theme.of(context).textTheme.titleLarge),
                  Text(
                    assets.toStringAsFixed(2),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              Divider(),
              const SizedBox(height: 40),
              AddButton(
                text: 'Add An Asset',
                onPressed: () => Navigator.pushNamed(context, '/manage_assets'),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
