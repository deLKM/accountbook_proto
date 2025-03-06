// Author: Ching-Yu

import '../providers/fa_button_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class FAButton extends ConsumerWidget {
  const FAButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final showRecordSheet = ref.watch(showRecordSheetProvider);

    return FloatingActionButton(
      onPressed: () => showRecordSheet(context),
      backgroundColor: theme.scaffoldBackgroundColor,
      elevation: 0,
      splashColor: Colors.transparent,
      enableFeedback: false,
      highlightElevation: 0,
      foregroundColor: theme.primaryColor,
      hoverColor: theme.primaryColorLight,
      hoverElevation: 0,
      shape: const CircleBorder(),
      child: const Icon(Icons.add),
    );
  }
}