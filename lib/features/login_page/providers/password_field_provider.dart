import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'password_field_provider.g.dart';

class PasswordFieldState {
  final bool showPassword;

  PasswordFieldState({this.showPassword = false});

  PasswordFieldState copyWith({bool? showPassword}) {
    return PasswordFieldState(
      showPassword: showPassword ?? this.showPassword,
    );
  }
}

@riverpod
class PasswordFieldNotifier extends _$PasswordFieldNotifier {
  @override
  PasswordFieldState build() {
    return PasswordFieldState();
  }

  void togglePasswordVisibility() {
    state = state.copyWith(showPassword: !state.showPassword);
  }
}