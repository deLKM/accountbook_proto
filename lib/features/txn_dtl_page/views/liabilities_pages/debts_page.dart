import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class DebtsPage extends ConsumerWidget {
  const DebtsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('Debts')),
    );  
  }
}