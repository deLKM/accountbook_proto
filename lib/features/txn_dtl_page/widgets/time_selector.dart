// Author: Ching-Yu

import 'package:accountbook_proto/features/txn_dtl_page/models/month_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimeSelector extends ConsumerWidget {
  const TimeSelector({
    super.key,
    required this.monthData,
  });

  final MonthSummary monthData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 0),
        child: Text(
          '${monthData.month.year}/${monthData.month.month}',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
