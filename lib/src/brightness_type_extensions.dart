import 'package:extensions_package/extensions_package.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:theme_management/theme_management.dart';

extension BrightnessTypeExtensions on BrightnessType {
  Widget icon(BuildContext context, {ThemeColors? modeColors}) {
    final modeColor = modeColors?.of(context) ??
        ThemeColors(
          dark: Colors.grey[400]!,
          light: Colors.yellow[600]!,
        ).of(context);
    switch (this) {
      case BrightnessType.appDark:
        return FaIcon(FontAwesomeIcons.solidMoon, color: modeColor);
      case BrightnessType.appLight:
        return FaIcon(FontAwesomeIcons.solidSun, color: modeColor);
      case BrightnessType.systemDark:
        return FaIcon(FontAwesomeIcons.lightbulb, color: modeColor);
      case BrightnessType.systemLight:
        return FaIcon(FontAwesomeIcons.solidLightbulb, color: modeColor);
    }
  }
}
