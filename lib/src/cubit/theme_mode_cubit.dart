import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'theme_mode_hive.dart';
part 'theme_mode_state.dart';

class ThemeModeCubit extends Cubit<ThemeModeState> {
  ThemeMode _themeMode;
  bool _usingHiveToPersistMode = false;

  ThemeModeCubit([ThemeMode? themeMode])
      : _themeMode = themeMode ?? ThemeMode.system,
        _usingHiveToPersistMode = (themeMode == null),
        super(ThemeModeInitial());

  Future<void> setup() async {
    if (_usingHiveToPersistMode) await _ThemeModeHive.hiveSetup();
  }

  set themeMode(mode) {
    if (_usingHiveToPersistMode) _ThemeModeHive.themeMode = mode;
    _themeMode = mode;
    emit(ThemeModeUpdate(mode));
  }

  void changeTheme(ThemeMode mode, ThemeData theme) => emit(ChangeThemeState(mode, theme));

  ThemeMode get themeMode => _usingHiveToPersistMode ? _ThemeModeHive.themeMode : _themeMode;
}
