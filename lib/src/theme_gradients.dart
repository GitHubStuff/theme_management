import 'package:extensions_package/extensions_package.dart';
import 'package:flutter/material.dart';

import '../theme_management.dart';

class ThemeGradients {
  final List<Color> dark;
  final List<Color> light;
  const ThemeGradients({required this.dark, required this.light});
  List<Color> of(BuildContext context) => (ThemeManagement.themeMode.of(context) == Brightness.dark) ? dark : light;
  factory ThemeGradients.mono({required List<Color> color}) => ThemeGradients(dark: color, light: color);
}
