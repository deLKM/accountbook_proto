import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

final selectedOptionLabelProvider = StateProvider<String?>((ref) => null);

final quantityControllerProvider = Provider<TextEditingController>((ref) {
  final controller = TextEditingController();
  ref.onDispose(() => controller.dispose());
  return controller;
});