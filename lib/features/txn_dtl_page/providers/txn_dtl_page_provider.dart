// Author: Ching-Yu

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/daily_data.dart';
import '../models/month_summary.dart';

final monthSummaryProvider = Provider<MonthSummary>((ref) {
  final now = DateTime.now();
  return MonthSummary(
    DateTime(now.year, now.month),
    0,
    0,
  );
});

final dailyDataProvider = Provider<List<DailyData>>((ref) {
  return [
    DailyData(
      DateTime.now(),
      [],
    ),
  ];
});