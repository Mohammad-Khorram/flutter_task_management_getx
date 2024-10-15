import 'package:flutter/material.dart';
import 'package:task_management/config/boilerplate/resource_boilerplate.dart';

class ThemeConfig {
  static ThemeData themeData = ThemeData(
    useMaterial3: true,
    primaryColor: ColorConfig.primary,
    primarySwatch: ColorConfig.primary,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorConfig.primary,
      selectionColor: ColorConfig.accent.withOpacity(0.3),
      selectionHandleColor: ColorConfig.accent,
    ),
    brightness: Brightness.light,
  );
}
