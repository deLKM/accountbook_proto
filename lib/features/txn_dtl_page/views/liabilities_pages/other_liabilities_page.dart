// Author: Ching-Yu

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class OtherLiabilitiesPage extends ConsumerWidget {
  const OtherLiabilitiesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('其他负债')),
    );  
  }
}