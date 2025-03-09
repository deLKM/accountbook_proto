// Author: Ching-Yu

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_page_provider.g.dart';

class ProfileState {
  final bool isLoggedIn;

  ProfileState({this.isLoggedIn = false});

  ProfileState copyWith({bool? isLoggedIn}) {
    return ProfileState(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    );
  }
}

@riverpod
class ProfileNotifier extends _$ProfileNotifier {
  @override
  ProfileState build() {
    return ProfileState();
  }

  void updateLoginStatus(bool status) {
    state = state.copyWith(isLoggedIn: status);
  }
}