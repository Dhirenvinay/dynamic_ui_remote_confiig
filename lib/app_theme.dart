import 'package:flutter/material.dart';
import 'app_config.dart';

ThemeData buildAppTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppConfig.backgroundColor,
    primaryColor: AppConfig.primaryColor,
    cardColor: AppConfig.cardColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppConfig.primaryColor,
      foregroundColor: Colors.white,
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: AppConfig.headingFontSize,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headlineMedium: const TextStyle(fontSize: 16, color: Colors.grey),
      titleLarge: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      bodyMedium: const TextStyle(fontSize: 14, color: Colors.grey),
    ),
    cardTheme: CardTheme(
      color: AppConfig.cardColor,
      elevation: AppConfig.cardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConfig.cardBorderRadius),
      ),
    ),
  );
}
