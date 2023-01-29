import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:physio_calc/app/core/themes/color_theme.dart';

/// Pengembangan saat ini, aplikasi menggunakan material 2
/// Todo: Jika selanjutnya ada pengembangan bisa ditawarkan dan menggunakan material 3

class AppTheme {
  static get lightThemeData => ThemeData(
      // useMaterial3: true,
      brightness: Brightness.light,
      colorSchemeSeed: ColorsTheme.primary,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      cardTheme: const CardTheme(
        color: Colors.white,
        margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      ));

  static get darkThemeData => ThemeData(
      // useMaterial3: true,
      brightness: Brightness.dark,
      colorSchemeSeed: ColorsTheme.primary,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      cardTheme: const CardTheme(
        margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style:
              ElevatedButton.styleFrom(backgroundColor: Get.theme.focusColor)));
}
