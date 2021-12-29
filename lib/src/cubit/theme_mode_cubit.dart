import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'hive_storage_thememode.dart';
part 'theme_mode_state.dart';

class ThemeModeCubit extends Cubit<ThemeModeState> {
  ThemeMode _themeMode;
  bool _usingHiveToPersistMode = false;

  ThemeModeCubit([ThemeMode? themeMode])
      : _themeMode = themeMode ?? ThemeMode.system,
        _usingHiveToPersistMode = (themeMode == null),
        super(ThemeModeInitial());

  Future<void> setup() async {
    if (_usingHiveToPersistMode) await _HiveStorageThemeMode.hiveSetup();
  }

  set themeMode(mode) {
    if (_usingHiveToPersistMode) _HiveStorageThemeMode.themeMode = mode;
    _themeMode = mode;
    emit(ThemeModeUpdate(mode));
  }

  void changeTheme(ThemeMode mode, ThemeData theme) => emit(ChangeThemeState(mode, theme));

  ThemeMode get themeMode => _usingHiveToPersistMode ? _HiveStorageThemeMode.themeMode : _themeMode;
}
