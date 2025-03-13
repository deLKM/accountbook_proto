import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/account_provider.dart';
import 'package:flutter/material.dart';

class CashPage extends ConsumerWidget {
  const CashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountNotifier = ref.read(accountNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Account')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                const Text('Title:', style: TextStyle(fontSize: 16)),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      accountNotifier.updateTitle(value);
                    },
                  ),
                ),
              ],
            ),
            const Divider(), 
            const SizedBox(height: 16),

            Row(
              children: [
                const Text('Subtitle:', style: TextStyle(fontSize: 16)),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      border: InputBorder.none, 
                    ),
                    onChanged: (value) {
                      accountNotifier.updateSubtitle(value);
                    },
                  ),
                ),
              ],
            ),
            const Divider(), 
            const SizedBox(height: 16),

            // 余额输入
            Row(
              children: [
                const Text('Balance:', style: TextStyle(fontSize: 16)),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      border: InputBorder.none, // 去掉边框
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      final balance = double.tryParse(value) ?? 0.0;

                      // 很显然我需要处理一下 Account 和 Ebit 的关系
                      accountNotifier.updateBalance(balance);
                    },
                  ),
                ),
            const Divider(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
