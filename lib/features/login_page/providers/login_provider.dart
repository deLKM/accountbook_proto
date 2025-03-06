// Author: Ching-Yu

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier() : super(LoginState());

  void toggleLoginType() {
    state = state.copyWith(isPasswordLogin: !state.isPasswordLogin);
  }

  Future<void> mockLogin(BuildContext context) async {
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
        Navigator.pop(context, true);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login failed. Please try again.')),
        );
      }
    } catch (e) {
      if (!mounted) return;

      state = state.copyWith(isLoading: false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
    }
  }
}

final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  return LoginNotifier();
});