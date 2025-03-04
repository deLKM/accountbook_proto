// Author: Ching-Yu

import 'package:accountbook_proto/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/txn_dtl_page.dart';
import 'pages/account_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/txndtl': (context) => const TxnDtlPage(),
        '/account': (context) => const AccountPage(),
      },
    );
  }
}