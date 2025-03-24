// Author: Ching-Yu

import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/account.dart';

part 'account_provider.g.dart';

// 我需要支持多 account 的功能
class AccountState {
  final List<Account> accounts; // 支持多账户
  final Account? selectedAccount; // 当前选中的账户

  AccountState({required this.accounts, this.selectedAccount});

  AccountState copyWith({
    List<Account>? accounts,
    Account? selectedAccount,
  }) {
    return AccountState(
      accounts: accounts ?? this.accounts,
      selectedAccount: selectedAccount ?? this.selectedAccount,
    );
  }
}

@riverpod
class AccountNotifier extends _$AccountNotifier {
  int _nextInternalId = 1;

  @override
  AccountState build() {
    // 初始化时，添加一个默认账户
    return AccountState(
      accounts: [],
      selectedAccount: null, // 默认没有选中的账户
    );
  }

  // 生成 internalId
  String _generateInternalId() {
    final internalId = 'ID-$_nextInternalId'; // 格式为 ID-1, ID-2, ID-3, ...
    _nextInternalId++; // 递增计数器
    return internalId;
  }

  // 添加账号
  Account addAccount({
    required String displayId,
    required String title,
    required String subtitle,
    required String subOf,
    bool? deleted,
  }) {
    final newAccount = Account(
      internalId: _generateInternalId(), // 生成 internalId
      displayId: displayId,
      title: title,
      subtitle: subtitle,
      subOf: subOf,
      deleted: deleted ?? false,
    );
    state = state.copyWith(
      accounts: [...state.accounts, newAccount],
    );
    // 调试信息
    print("New Account Is Added: ${state.accounts}");
    return newAccount;
  }

  // 删除账户
  void removeAccount(String displayId) {
    state = state.copyWith(
      accounts: state.accounts.where((a) => a.displayId != displayId).toList(),
    );
  }

  // 更新账户
  void updateAccount(Account updatedAccount) {
    state = state.copyWith(
      accounts: state.accounts.map((a) {
        if (a.displayId == updatedAccount.displayId) {
          return updatedAccount;
        }
        return a;
      }).toList(),
    );
  }

  // 更新选中账户
  void selectAccount(String displayId) {
    final selectedAccount = state.accounts.firstWhere(
      (a) => a.displayId == displayId,
      orElse: () => throw Exception('Account not found'),
    );
    state = state.copyWith(selectedAccount: selectedAccount);
  }

  // 清除选中账户
  void clearSelectedAccount() {
    state = state.copyWith(selectedAccount: null);
  }
}