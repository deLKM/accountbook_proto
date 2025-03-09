// Author: Ching-Yu

import '../providers/fa_button_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class FAButton extends ConsumerWidget {
  const FAButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showRecordSheet = ref.watch(showRecordSheetProvider);

    return FloatingActionButton(
      onPressed: () => showRecordSheet(context),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      splashColor: Colors.transparent,
      enableFeedback: false,
      highlightElevation: 0,
      foregroundColor: Theme.of(context).primaryColor,
      hoverElevation: 0,
      shape: const CircleBorder(),
      child: const Icon(Icons.add),
    );
  }
}