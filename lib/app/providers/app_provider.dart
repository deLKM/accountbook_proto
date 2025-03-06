// Author: Ching-Yu

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../app_theme.dart';
import '../app_router.dart';

final themeProvider = Provider<ThemeData>((ref) => appTheme);

final routesProvider = Provider<Map<String, WidgetBuilder>>((ref) => appRoutes);