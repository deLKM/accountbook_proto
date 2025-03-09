import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:async';

part 'code_field_provider.g.dart';

class CaptchaState {
  final int countdown;
  final bool isLoading;
  final Object? error;

  CaptchaState({
    this.countdown = 0,
    this.isLoading = false,
    this.error,
  });

  CaptchaState copyWith({
    int? countdown,
    bool? isLoading,
    Object? error,
  }) {
    return CaptchaState(
      countdown: countdown ?? this.countdown,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

@riverpod
class CaptchaNotifier extends _$CaptchaNotifier {
  Timer? _timer;

  @override
  CaptchaState build() {
    ref.onDispose(() {
      _timer?.cancel();
    });

    return CaptchaState();
  }

  Future<void> getCaptcha(String phoneNumber) async {
    if (state.countdown > 0 || state.isLoading) return;

    if (phoneNumber.isEmpty) {
      state = state.copyWith(error: 'Phone number is required');
      return;
    }

    try {
      state = state.copyWith(isLoading: true, error: null);

      // 模拟 API 调用
      await Future.delayed(const Duration(seconds: 1));

      state = state.copyWith(
        countdown: 60,
        isLoading: false,
      );

      _startCountdown();
    } catch (e) {
      state = state.copyWith(
        error: e.toString(),
        isLoading: false,
      );
    }
  }

  void _startCountdown() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (state.countdown > 0) {
        state = state.copyWith(countdown: state.countdown - 1);
      } else {
        _timer?.cancel();
      }
    });
  }
}