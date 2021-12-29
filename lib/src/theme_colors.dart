import 'package:extensions_package/extensions_package.dart';
import 'package:flutter/material.dart';

import '../theme_management.dart';

class ThemeColors {
  final Color dark;
  final Color light;
  const ThemeColors({required this.dark, required this.light});
  Color of(BuildContext context) => (ThemeManagement.themeMode.of(context) == Brightness.dark) ? dark : light;
  factory ThemeColors.mono({required Color color}) => ThemeColors(dark: color, light: color);
}
