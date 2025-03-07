// Author: Ching-Yu

import 'package:accountbook_proto/common/widgets/proto_appbar.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProtoAppBar(title: 'Account'),
    );
  }
}