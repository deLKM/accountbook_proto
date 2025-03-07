// Author: Ching-Yu

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/daily_data.dart';
import '../models/month_summary.dart';

/// Provides the summary of the current month.
final monthSummaryProvider = StateProvider<MonthSummary>((ref) {
  final now = DateTime.now();
  return MonthSummary(
    DateTime(now.year, now.month),
    0,
    0,
  );
});

/// Provides a list of daily data, starting with the current date.
final dailyDataProvider = StateProvider<List<DailyData>>((ref) {
  return [
    DailyData(
      DateTime.now(),
      [], 
    ),
  ];
});