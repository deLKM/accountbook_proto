// Author: Ching-Yu

import '../features/main_page/views/main_page.dart';
import 'app_theme.dart';
import  'app_router.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: MainPage(),
      routes: appRoutes,
    );
  }
}