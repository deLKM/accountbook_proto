// Author: Ching-Yu

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class CreditCardsPage extends ConsumerWidget {
  const CreditCardsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('信用卡')),
    );  
  }
}