import 'package:flutter/material.dart';

import 'cubit/theme_mode_cubit.dart';
import 'theme_data/default_themes.dart';

class ThemeManagement {
  static ThemeModeCubit _themeModeCubit = ThemeModeCubit();
  static ThemeModeCubit get themeModeCubit => _themeModeCubit;

  static Future<void> setup([ThemeMode? themeMode]) async {
    _themeModeCubit = ThemeModeCubit(themeMode);
    await _themeModeCubit.setup();
  }

  static set themeMode(ThemeMode mode) => _themeModeCubit.themeMode = mode;

  static ThemeMode get themeMode => _themeModeCubit.themeMode;

  static ThemeData _darkTheme = DefaultThemes.defaultDarkThemeData();

  static ThemeData get darkTheme => _darkTheme;

  static set darkTheme(ThemeData themeData) {
    _darkTheme = themeData;
    _themeModeCubit.changeTheme(ThemeMode.dark, themeData);
  }

  static ThemeData _lightTheme = DefaultThemes.defaultLightThemeData;

  static ThemeData get lightTheme => _lightTheme;

  static set lightTheme(ThemeData themeData) {
    _lightTheme = themeData;
    _themeModeCubit.changeTheme(ThemeMode.light, themeData);
  }
}
