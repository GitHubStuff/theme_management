import 'package:extensions_package/extensions_package.dart';
import 'package:flutter/material.dart';

import '../theme_management.dart';

extension ThemeModeBrightnessTypeExtension on ThemeMode {
  BrightnessType brightnessMode(BuildContext context) {
    switch (this) {
      case ThemeMode.dark:
        return BrightnessType.appDark;
      case ThemeMode.light:
        return BrightnessType.appLight;
      case ThemeMode.system:
        return context.platformBrightness == Brightness.dark ? BrightnessType.systemDark : BrightnessType.systemLight;
    }
  }
}
