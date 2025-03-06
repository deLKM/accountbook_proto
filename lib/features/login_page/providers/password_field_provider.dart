// Author: Ching-Yu

import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordFieldState {
  final bool showPassword;

  PasswordFieldState({this.showPassword = false});

  PasswordFieldState copyWith({bool? showPassword}) {
    return PasswordFieldState(
      showPassword: showPassword ?? this.showPassword,
    );
  }
}

class PasswordFieldNotifier extends StateNotifier<PasswordFieldState> {
  PasswordFieldNotifier() : super(PasswordFieldState());

  void togglePasswordVisibility() {
    state = state.copyWith(showPassword: !state.showPassword);
  }
}

final passwordFieldProvider = StateNotifierProvider<PasswordFieldNotifier, PasswordFieldState>((ref) {
  return PasswordFieldNotifier();
});