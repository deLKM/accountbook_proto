// Author: Ching-Yu

import 'package:flutter/material.dart';

final appTheme = ThemeData(
  primaryColor: Colors.lightBlueAccent,
  scaffoldBackgroundColor: Colors.white,
  splashColor: Colors.transparent,
  splashFactory: NoSplash.splashFactory,
  hoverColor: Colors.transparent,
  focusColor: Colors.transparent,
  highlightColor: Colors.transparent,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    titleTextStyle: TextStyle(
      color: Color(0xFF2D2D2D),

      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    titleSpacing: 20,
    centerTitle: false,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.lightBlue,
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue),
    ),
    labelStyle: TextStyle(color: Colors.blue),
  ),
);