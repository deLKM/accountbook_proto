// Author: Ching-Yu

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class CreditorsRightsPages extends ConsumerWidget {
  const CreditorsRightsPages({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('股权')),
    );
  }
}