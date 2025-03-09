// Author: Ching-Yu

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/password_field_provider.dart';

class PasswordField extends ConsumerWidget {
  final TextEditingController controller;
  final double width;
  final String hintText;
  final String? Function(String?)? validator;

  const PasswordField({
    super.key,
    required this.controller,
    required this.width,
    required this.hintText,
    this.validator,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passwordState = ref.watch(passwordFieldNotifierProvider);
    final passwordNotifier = ref.read(passwordFieldNotifierProvider.notifier);

    return Center(
      child: SizedBox(
        width: width,
        child: TextFormField(
          controller: controller,
          obscureText: !passwordState.showPassword,
          decoration: InputDecoration(
            labelText: hintText,
            prefixIcon: const Icon(Icons.lock_rounded),
            suffixIcon: IconButton(
              onPressed: passwordNotifier.togglePasswordVisibility,
              icon: Icon(passwordState.showPassword
                  ? Icons.visibility_off_rounded
                  : Icons.visibility_rounded),
            ),
          ),
          validator: (value) {
            if (value?.isEmpty ?? true) return 'Please enter your Password';
            if (value!.length < 6) return 'At least 6-digit Password is needed';
            return null;
          },
        ),
      ),
    );
  }
}