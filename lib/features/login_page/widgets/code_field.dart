// Author: Ching-Yu

import '../providers/code_field_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CodeField extends ConsumerWidget {
  const CodeField({
    super.key,
    required this.codeController,
    required this.phoneController,
    required this.width,
  });

  final TextEditingController codeController;
  final TextEditingController phoneController;
  final double width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(captchaNotifierProvider);
    final notifier = ref.read(captchaNotifierProvider.notifier);

    ref.listen(captchaNotifierProvider.select((s) => s.error), (_, error) {
      if (error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.toString())),
        );
      }
    });

    return Center(
      child: SizedBox(
        width: width,
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: codeController,
                decoration: InputDecoration(
                  labelText: 'CAPTCHA',
                  prefixIcon: const Icon(Icons.sms_rounded),
                  hintText: 'Please enter 6-digit CAPTCHA',
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) return 'Please enter the CAPTCHA';
                  if (value!.length != 6) return 'At least 6-digit CAPTCHA is needed';
                  return null;
                },
              ),
            ),
            const SizedBox(width: 12),
            OutlinedButton(
              onPressed: state.countdown == 0 && !state.isLoading
                  ? () => notifier.getCaptcha(phoneController.text)
                  : null,
              child: state.isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(
                      state.countdown > 0
                          ? 'Retry (${state.countdown}s)'
                          : 'Get CAPTCHA',
                    ),
            ),
          ],
        ),
      ),
    );
  }
}