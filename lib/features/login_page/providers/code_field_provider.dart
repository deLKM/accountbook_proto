// Author: Ching-Yu

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';

final captchaProvider = StateNotifierProvider<CaptchaNotifier, CaptchaState>(
  (ref) => CaptchaNotifier(),
);

class CaptchaState {
  final int countdown;
  final bool isLoading;
  final Object? error;

  CaptchaState({
    this.countdown = 0,
    this.isLoading = false,
    this.error,
  });
}

class CaptchaNotifier extends StateNotifier<CaptchaState> {
  CaptchaNotifier() : super(CaptchaState());

  Timer? _timer;

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

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

extension _CaptchaStateCopyWith on CaptchaState {
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