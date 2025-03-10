// Author: Ching-Yu

import 'package:flutter/material.dart';

// 定义颜色常量
const Color primaryBlue = Color.fromARGB(255, 100, 181, 246); // 主色调：浅蓝色
const Color primaryBlueDark = Color.fromARGB(255, 66, 165, 245); // 深色版本
const Color primaryBlueLight = Color.fromARGB(255, 187, 222, 251); // 浅色版本
const Color scaffoldBackground = Color.fromARGB(255, 248, 250, 252); // 背景色：浅灰蓝

final appTheme = ThemeData(
  primaryColor: primaryBlue,
  primaryColorDark: primaryBlueDark,
  primaryColorLight: primaryBlueLight,
  scaffoldBackgroundColor: scaffoldBackground,

  // 禁用动画相关颜色
  splashColor: Colors.transparent,
  splashFactory: NoSplash.splashFactory,
  hoverColor: Colors.transparent,
  focusColor: Colors.transparent,
  highlightColor: Colors.transparent,

  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 57, fontWeight: FontWeight.bold), // 大标题
    displayMedium: TextStyle(fontSize: 45, fontWeight: FontWeight.bold), // 中标题
    displaySmall: TextStyle(fontSize: 36, fontWeight: FontWeight.bold), // 小标题
    headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold), // 大标题
    headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold), // 中标题
    headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), // 小标题
    titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold), // 大标题
    titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), // 中标题
    titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.bold), // 小标题
    bodyLarge: TextStyle(fontSize: 16, color: Colors.black87), // 大正文
    bodyMedium: TextStyle(fontSize: 14, color: Colors.black87), // 中正文
    bodySmall: TextStyle(fontSize: 12, color: Colors.black87), // 小正文
    labelLarge: TextStyle(fontSize: 14, color: Colors.grey), // 大标签
    labelMedium: TextStyle(fontSize: 12, color: Colors.grey), // 中标签
    labelSmall: TextStyle(fontSize: 10, color: Colors.grey), // 小标签
  ),

  // AppBar 主题
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    titleTextStyle: TextStyle(
      color: primaryBlue, // 标题颜色为主色调
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    titleSpacing: 20,
    centerTitle: false,
    elevation: 0, // 移除阴影
  ),

  // 按钮主题
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primaryBlue, // 按钮背景色
      foregroundColor: Colors.white, // 按钮文本颜色
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30), // 圆角按钮
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12), // 内边距
    ),
  ),

  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(
      backgroundColor: Colors.transparent, // 背景色为透明
      hoverColor: Colors.transparent, // 悬停颜色为透明
      focusColor: Colors.transparent, // 聚焦颜色为透明
      highlightColor: Colors.transparent, // 高亮颜色为透明
    ),
  ),

  // 文本按钮主题
  textButtonTheme: TextButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white, // 按钮文本颜色
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30), // 圆角按钮
      ),
    ),
  ),

  // 卡片主题
  cardTheme: CardTheme(
    color: Colors.white, // 卡片背景色为白色
    elevation: 2, // 轻微阴影
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16), // 圆角卡片
    ),
    margin: const EdgeInsets.all(8), // 外边距
  ),

  // 输入框主题
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
    ), // 默认边框
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: BorderSide(
        color: primaryBlue,
        width: 2.0,
        ), // 聚焦时边框颜色
    ),
    labelStyle: TextStyle(color: Colors.grey), // 默认标签颜色
    // focusedLabelStyle: TextStyle(color: primaryBlue), // 聚焦时标签颜色
  ),
);