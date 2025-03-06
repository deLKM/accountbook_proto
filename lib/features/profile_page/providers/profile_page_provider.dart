// Author: Ching-Yu

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileState {
  final bool isLoggedIn;

  ProfileState({this.isLoggedIn = false});

  ProfileState copyWith({bool? isLoggedIn}) {
    return ProfileState(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    );
  }
}

class ProfileNotifier extends StateNotifier<ProfileState> {
  ProfileNotifier() : super(ProfileState());

  void updateLoginStatus(bool status) {
    state = state.copyWith(isLoggedIn: status);
  }
}

final profileProvider = StateNotifierProvider<ProfileNotifier, ProfileState>((ref) {
  return ProfileNotifier();
});