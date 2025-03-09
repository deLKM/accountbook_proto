// Author: Ching-Yu

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../app_theme.dart';
import '../app_router.dart';

part 'app_provider.g.dart';

@riverpod
ThemeData theme(ref) => appTheme;

@riverpod
Map<String, WidgetBuilder> routes(ref) => appRoutes;