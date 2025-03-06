// Author: Ching-Yu

import '../widgets/bottom_nav_bar.dart';
import '../widgets/fa_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/main_page_provider.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexProvider);
    final pages = ref.watch(pagesProvider);

    return Scaffold(
      body: IndexedStack(index: selectedIndex, children: pages),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: selectedIndex,
        onTap: (index) => ref.read(selectedIndexProvider.notifier).state = index,
      ),
      floatingActionButton: FAButton(context: context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}