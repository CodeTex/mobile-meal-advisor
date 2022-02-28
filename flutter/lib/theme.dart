import 'dart:math';
import 'package:flutter/material.dart';

MaterialColor generateMaterialColor(Color color) {
  return MaterialColor(
    color.value,
    {
      50: tintColor(color, 0.9),
      100: tintColor(color, 0.8),
      200: tintColor(color, 0.6),
      300: tintColor(color, 0.4),
      400: tintColor(color, 0.2),
      500: color,
      600: shadeColor(color, 0.1),
      700: shadeColor(color, 0.2),
      800: shadeColor(color, 0.3),
      900: shadeColor(color, 0.4),
    },
  );
}

int tintValue(int value, double factor) =>
    max(0, min((value + ((255 - value) * factor)).round(), 255));

Color tintColor(Color color, double factor) => Color.fromRGBO(
      tintValue(color.red, factor),
      tintValue(color.green, factor),
      tintValue(color.blue, factor),
      1,
    );

int shadeValue(int value, double factor) =>
    max(0, min(value - (value * factor).round(), 255));

Color shadeColor(Color color, double factor) => Color.fromRGBO(
      shadeValue(color.red, factor),
      shadeValue(color.green, factor),
      shadeValue(color.blue, factor),
      1,
    );

final ThemeData materialAdvisorTheme = ThemeData(
  primarySwatch: generateMaterialColor(Palette.primary),
);

class Palette {
  static const Color primary = Color(0xFF62788E);
  static const Color secondary = Color(0xFFC3CCD5);
  static const Color tertiary = Color(0xFF103356);
  static const Color quartery = Color(0xFFE1E5EA);
}
