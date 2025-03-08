// Author: Ching-Yu

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../record_a_bill/views/record_a_bill_page.dart';

final recordPageProvider = Provider<Widget>((ref) => RecordPage());

final showRecordSheetProvider = Provider<void Function(BuildContext context)>((ref) {
  return (context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: false,
      builder: (context) => ref.read(recordPageProvider),
    );
  };
});