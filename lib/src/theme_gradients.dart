import 'package:extensions_package/extensions_package.dart';
import 'package:flutter/material.dart';

import '../theme_management.dart';

class ThemeGradients {
  final List<Color> dark;
  final List<Color> light;
  final AlignmentGeometry beginAlignmentGeometry;
  final AlignmentGeometry endAlignmentGeometry;
  const ThemeGradients({
    required this.dark,
    required this.light,
    AlignmentGeometry? beginningAlignmentGeometry,
    AlignmentGeometry? endingAlignmentGeometry,
  })  : beginAlignmentGeometry = beginningAlignmentGeometry ?? Alignment.centerLeft,
        endAlignmentGeometry = endingAlignmentGeometry ?? Alignment.centerRight;

  List<Color> of(BuildContext context) {
    List<Color> result = (ThemeManagement.themeMode.of(context) == Brightness.dark) ? dark : light;
    assert(result.isNotEmpty, 'Cannot have empty list of colors');
    if (result.length == 1) result.add(result[0]);
    return result;
  }

  factory ThemeGradients.mono({
    required List<Color> color,
    AlignmentGeometry? beginningAlignmentGeometry,
    AlignmentGeometry? endingAlignmentGeometry,
  }) =>
      ThemeGradients(
        dark: color,
        light: color,
        beginningAlignmentGeometry: beginningAlignmentGeometry,
        endingAlignmentGeometry: endingAlignmentGeometry,
      );
}
