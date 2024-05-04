import 'package:flutter/material.dart';
import 'package:flutter_components/theme/dark_theme.dart';
import 'package:flutter_components/theme/light_theme.dart';

class IngloTheme {
  static final IngloTheme _instance = IngloTheme._internal();

  factory IngloTheme() => _instance;

  IngloTheme._internal();

  final lightTheme = ThemeData().myLightTheme;

  final darkTheme = ThemeData().myDarkTheme;
}

extension MyAppCustomTheme on ThemeData {
  ThemeData get myLightTheme => LightThemeClass().lightTheme;
  ThemeData get myDarkTheme => DarkThemeClass().darkTheme;
}
