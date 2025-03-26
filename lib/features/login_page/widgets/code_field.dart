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
                  labelText: '验证码',
                  prefixIcon: const Icon(Icons.sms_rounded),
                  hintText: '请输入6位验证码',
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) return '请输入验证码';
                  if (value!.length != 6) return '请输入6位验证码';
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
                          ? '${state.countdown}s 后重试'
                          : '获取验证码',
                    ),
            ),
          ],
        ),
      ),
    );
  }
}