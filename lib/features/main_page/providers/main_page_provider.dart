// Author: Ching-Yu

import '../../account_page/views/account_page.dart';
import '../../plan_page/views/plan_page.dart';
import '../../profile_page/views/profile_page.dart';
import '../../txn_dtl_page/views/txn_dtl_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

final selectedIndexProvider = StateProvider<int>((ref) => 0);

final pagesProvider = Provider<List<Widget>>((ref) {
  return [
    TxnDtlPage(),
    PlanPage(),
    AccountPage(),
    ProfilePage(),
  ];
});