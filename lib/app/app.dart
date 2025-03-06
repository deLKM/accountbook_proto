// Author: Ching-Yu

import '../features/main_page/views/main_page.dart';
import 'providers/app_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final routes = ref.watch(routesProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: MainPage(),
      routes: routes,
    );
  }
}