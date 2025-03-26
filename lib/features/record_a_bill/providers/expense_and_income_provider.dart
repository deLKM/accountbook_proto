// Author: Ching-Yu

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'expense_and_income_provider.g.dart';

@riverpod
class SelectedOptionLabel extends _$SelectedOptionLabel {
  @override
  String? build() {
    return null; 
  }

  void updateLabel(String? label) {
    state = label; 
  }
}

@riverpod
TextEditingController priceController(ref) {
  final controller = TextEditingController();
  ref.onDispose(() => controller.dispose());
  return controller;
}