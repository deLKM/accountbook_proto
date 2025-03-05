// Author: Ching-Yu

import 'package:accountbook_proto/pages/main_page.dart';
import 'package:accountbook_proto/pages/plan_page.dart';
import 'package:accountbook_proto/pages/profile_page.dart';
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        splashColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),       
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blue,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
          labelStyle: TextStyle(color: Colors.blue),
        ),
      ),
      home: MainPage(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/txndtl': (context) => TxnDtlPage(),
        '/account': (context) => const AccountPage(),
        '/plan': (context) => const PlanPage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}