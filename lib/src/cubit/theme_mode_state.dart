part of 'theme_mode_cubit.dart';

@immutable
abstract class ThemeModeState {}

class ThemeModeInitial extends ThemeModeState {}

class ThemeModeUpdate extends ThemeModeState {
  final ThemeMode newThemeMode;
  ThemeModeUpdate(this.newThemeMode);
}

class RefreshTheme extends ThemeModeState {}
