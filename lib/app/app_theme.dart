// Author: Ching-Yu

import 'package:flutter/material.dart';

final appTheme = ThemeData(
  primaryColor: const Color.fromARGB(255, 255, 243, 114),
  primaryColorDark: const Color.fromARGB(255, 255, 234, 117),
  primaryColorLight: const Color.fromARGB(255, 255, 251, 201),
  scaffoldBackgroundColor: const Color.fromARGB(255, 255, 254, 249),

  // Ban animation-related colors
  splashColor: Colors.transparent,
  splashFactory: NoSplash.splashFactory,
  hoverColor: Colors.transparent,
  focusColor: Colors.transparent,
  highlightColor: Colors.transparent,
  
  // Theme of the App Bar
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    titleTextStyle: TextStyle(
      color: Color.fromARGB(255, 255, 243, 114),
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    titleSpacing: 20,
    centerTitle: false,
  ),

  // Theme of the Button
  buttonTheme: ButtonThemeData(
    buttonColor: Color.fromARGB(255, 255, 243, 114),
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
  ),

  // Theme of the Card
  cardTheme: CardTheme(
    color: const Color.fromARGB(255, 255, 243, 114),
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25),
    ),
  ),

  // Theme of Input Decoration
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromARGB(255, 255, 243, 114)),
    ),
    labelStyle: TextStyle(color: Color.fromARGB(255, 255, 242, 100)),
  ),
);