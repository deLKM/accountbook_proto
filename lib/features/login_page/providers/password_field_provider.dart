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

class PasswordFieldNotifier extends Notifier<PasswordFieldState> {
  @override
  PasswordFieldState build() {
    return PasswordFieldState();
  }

  void togglePasswordVisibility() {
    state = state.copyWith(showPassword: !state.showPassword);
  }
}

final passwordFieldProvider = NotifierProvider<PasswordFieldNotifier, PasswordFieldState>(() {
  return PasswordFieldNotifier();
});