// Author: Ching-Yu

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'expense_and_income_provider.g.dart'; // 引入生成的代码

@riverpod
class SelectedOptionLabel extends _$SelectedOptionLabel {
  @override
  String? build() {
    return null; // 默认值为 null
  }

  void updateLabel(String? label) {
    state = label; // 更新状态
  }
}

@riverpod
TextEditingController quantityController(ref) {
  final controller = TextEditingController();
  ref.onDispose(() => controller.dispose());
  return controller;
}