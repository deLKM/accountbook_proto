// Author: Ching-Yu

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AALButton extends ConsumerWidget {
  final String labeltext;
  final VoidCallback onPressed;

  const AALButton({
    super.key, 
    required this.labeltext,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(16), 
      ),
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 20),
        child: Text(
          labeltext,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
