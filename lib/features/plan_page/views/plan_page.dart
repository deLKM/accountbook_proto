// Author: Ching-Yu

import 'package:accountbook_proto/common/widgets/proto_appbar.dart';
import 'package:flutter/material.dart';

class PlanPage extends StatefulWidget {
  const PlanPage({super.key});

  @override
  State<PlanPage> createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProtoAppBar(title: 'Plan'),
    );
  }
}