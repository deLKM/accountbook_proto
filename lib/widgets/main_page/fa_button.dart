// Author: Ching-Yu

import 'package:flutter/material.dart';

class FAButton extends StatelessWidget {
  const FAButton({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FloatingActionButton(
      onPressed: () {},

      backgroundColor: theme.scaffoldBackgroundColor,
      elevation: 0,
      splashColor: Colors.transparent,
      enableFeedback: false,
      highlightElevation: 0,
      foregroundColor: theme.primaryColor,
      hoverColor: theme.primaryColorLight,
      hoverElevation: 0,
      shape: CircleBorder(),
      child: const Icon(Icons.add),
    );
  }
}