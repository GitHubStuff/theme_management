part of 'theme_mode_cubit.dart';

const String _hiveBoxName = 'com.icodeforyou.hiveboxname.thememode';

class _ThemeModeHive {
  static Box? box;

  static Future<void> hiveSetup() async {
    try {
      await Hive.initFlutter();
      box = await Hive.openBox<String>(_hiveBoxName);
    } on NullThrownError {
    } on MissingPluginException {
    } catch (e) {
      throw FlutterError(e.toString());
    }
  }

  static set themeMode(ThemeMode mode) {
    box?.put(_hiveBoxName, mode.name);
  }

  static ThemeMode get themeMode {
    final String storedValue = box?.get(_hiveBoxName) ?? ThemeMode.system.name;
    for (ThemeMode mode in ThemeMode.values) {
      if (mode.name == storedValue) return mode;
    }
    throw FlutterError('Unknow mode stored as $storedValue');
  }
}
