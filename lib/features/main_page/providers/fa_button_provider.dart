// Author: Ching-Yu

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../record_a_bill/views/record_a_bill_page.dart';

part 'fa_button_provider.g.dart'; // 生成的文件

@riverpod
Widget recordPage(ref) {
  return RecordPage();
}

@riverpod
void Function(BuildContext context) showRecordSheet(ref) {
  return (context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: false,
      builder: (context) => ref.read(recordPageProvider),
    );
  };
}