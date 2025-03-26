// Author: Ching-Yu

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class OtherAssetsPage extends ConsumerWidget {
  const OtherAssetsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('其他资产')),
    );  
  }
}