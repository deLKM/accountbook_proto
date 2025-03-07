// Author: Ching-Yu

import 'package:accountbook_proto/common/widgets/proto_appbar.dart';
import 'package:flutter/material.dart';

class ChangeAvatarPage extends StatelessWidget {
  const ChangeAvatarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProtoAppBar(title: 'Change Avatar'),
    );
  }
}