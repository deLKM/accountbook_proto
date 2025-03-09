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

class ProfileNotifier extends Notifier<ProfileState> {
  @override
  ProfileState build() {
    return ProfileState();
  }

  void updateLoginStatus(bool status) {
    state = state.copyWith(isLoggedIn: status);
  }
}

final profileProvider = NotifierProvider<ProfileNotifier, ProfileState>(() {
  return ProfileNotifier();
});