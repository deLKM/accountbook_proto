// Author: Ching-Yu

import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/account.dart';

part 'account_provider.g.dart';

class AccountState {
  final Account account;

  AccountState({required this.account});

  AccountState copyWith({Account? account}) {
    return AccountState(account: account ?? this.account);
  }
}

@riverpod
class AccountNotifier extends _$AccountNotifier {
  @override
  AccountState build() {
    return AccountState(
      account: Account(
        internalId: 'defaultId',
        displayId: 'defaultDisplayId',
        title: '',
        subtitle: '',
        subOf: '',
      ),
    );
  }

  // 更新 title
  void updateTitle(String newTitle) {
    state = state.copyWith(
      account: state.account.copyWith(title: newTitle),
    );
  }

  // 更新 subtitle
  void updateSubtitle(String newSubtitle) {
    state = state.copyWith(
      account: state.account.copyWith(subtitle: newSubtitle),
    );
  }

  // 更新 subOf
  void updateSubOf(String newSubOf) {
    state = state.copyWith(
      account: state.account.copyWith(subOf: newSubOf),
    );
  }
}
