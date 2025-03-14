// Author: Ching-Yu

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../profile_page/providers/profile_page_provider.dart';

part 'login_provider.g.dart';

class LoginState {
  final bool isPasswordLogin;
  final bool isLoading;

  LoginState({
    this.isPasswordLogin = true,
    this.isLoading = false,
  });

  LoginState copyWith({
    bool? isPasswordLogin,
    bool? isLoading,
  }) {
    return LoginState(
      isPasswordLogin: isPasswordLogin ?? this.isPasswordLogin,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class LoginNotifier extends _$LoginNotifier {
  @override
  LoginState build() {
    return LoginState();
  }

  void toggleLoginType() {
    state = state.copyWith(isPasswordLogin: !state.isPasswordLogin);
  }

  Future<void> mockLogin(BuildContext context, WidgetRef ref) async {
    if (state.isLoading) return;

    state = state.copyWith(isLoading: true);

    try {
      // 模拟登录过程
      await Future.delayed(const Duration(seconds: 2));

      // 假设登录成功
      bool loginSuccess = true;

      if (!context.mounted) return;

      state = state.copyWith(isLoading: false);

      if (loginSuccess) {
        // 更新登录状态
        ref.read(profileNotifierProvider.notifier).updateLoginStatus(true);

        Navigator.pop(context, true);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login failed. Please try again.')),
        );
      }
    } catch (e) {
      if (!context.mounted) return;

      state = state.copyWith(isLoading: false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
    }
  }

  Future<void> resetPassword(
    BuildContext context,
    String phone,
    String code,
    String newPassword,
    String confirmPassword,
  ) async {
    if (newPassword != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match.')),
      );
      return;
    }

    state = state.copyWith(isLoading: true);

    // 模拟网络请求
    await Future.delayed(const Duration(seconds: 2));

    if (!context.mounted) return;

    state = state.copyWith(isLoading: false);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Password reset successfully!')),
    );

    Navigator.pop(context); // 返回上一页
  }
}