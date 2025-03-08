// Author: Ching-Yu

import 'package:flutter/material.dart';

class ProtoAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double lineHeight;
  final Color lineColor;

  const ProtoAppBar({
    super.key,
    required this.title,
    this.lineHeight = 2,
    this.lineColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      title: Text(title, style: theme.appBarTheme.titleTextStyle),
      backgroundColor: theme.appBarTheme.backgroundColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
