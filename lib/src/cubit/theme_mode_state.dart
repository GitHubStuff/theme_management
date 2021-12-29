part of 'theme_mode_cubit.dart';

@immutable
abstract class ThemeModeState {}

class ThemeModeInitial extends ThemeModeState {}

class ThemeModeUpdate extends ThemeModeState {
  final ThemeMode newThemeMode;
  ThemeModeUpdate(this.newThemeMode);
}

class ChangeThemeState extends ThemeModeState {
  final ThemeMode mode;
  final ThemeData themeData;
  ChangeThemeState(this.mode, this.themeData);
}
