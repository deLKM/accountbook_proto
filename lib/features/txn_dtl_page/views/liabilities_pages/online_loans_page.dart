import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class OnlineLoansPage extends ConsumerWidget {
  const OnlineLoansPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('Online Loans')),
    );  
  }
}