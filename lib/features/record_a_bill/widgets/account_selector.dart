// Author: Ching-Yu

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../txn_dtl_page/models/account.dart';
import 'package:flutter/material.dart';

class AccountSelector extends ConsumerWidget {
  const AccountSelector({super.key});

  // 获得 HiveBox 里的所有 account
  Future<List<Account>> _getAccounts() async {
    final box = await Hive.openBox<Account>('accounts');
    return box.values.toList();
  }

  // 获取选中的账户
  Account? _getSelectedAccount(Box<Account> box) {
    try {
      return box.values.firstWhere((account) => account.isSelected);
    } catch(e) {
      return null;
    }
  }

  // 更新选中的账户
  // 现在有个问题，第一次选中的 Account，
  // 它的 isSelected 会一直是 true，就会报错
  void _selectAccount(Box<Account> box, String displayId) {
    final accounts = box.values.toList();
    for (var account in accounts) {
      final isSelected = account.displayId == displayId;
      if (account.isSelected != isSelected) {
        account.isSelected = isSelected;
        box.put(account.displayId, account);
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<List<Account>>(
      future: _getAccounts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text('No accounts available');
        } else {
          final accounts = snapshot.data!;
          return ValueListenableBuilder(
            valueListenable: Hive.box<Account>('accounts').listenable(),
            builder: (context, Box<Account> box, _) {
              final selectedAccount = _getSelectedAccount(box);
              return SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<Account>(
                      value: selectedAccount,
                      onChanged: (Account? newValue) {
                        if (newValue != null) {
                          _selectAccount(box, newValue.displayId);
                          print('New Account Is Settled: $newValue');
                        }
                      },
                      items: accounts
                          .map<DropdownMenuItem<Account>>((Account account) {
                        return DropdownMenuItem<Account>(
                          value: account,
                          child: Text(
                            account.title,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        );
                      }).toList(),
                      isExpanded: true,
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
