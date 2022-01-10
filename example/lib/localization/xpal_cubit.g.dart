// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'xpal_cubit.dart';

// **************************************************************************
// LocalizeCubitGenerator
// **************************************************************************

//MARK: Helper class XPALLanguage for getting/setting Locale
class XPALLanguage {
  static Cubit<XPALLocalizationState> get cubit => _XPALLocalizationCubit.cubit;
  static Future<void> setup({Locale? locale}) =>
      _XPALLocalizationCubit.setup(locale: locale);
  static Locale get locale => _XPALLocalizationCubit.locale;
  static set locale(Locale newLocale) =>
      _XPALLocalizationCubit.locale = newLocale;
  static String translate(XPALLocalization token, {Locale? locale}) =>
      token.byLocale(locale ?? _XPALLocalizationCubit.locale);
}

//MARK: Cubit
class _XPALLocalizationCubit extends Cubit<XPALLocalizationState> {
  static final _XPALLocalizationCubit _singleton =
      _XPALLocalizationCubit._internal();
  factory _XPALLocalizationCubit() => _singleton;
  _XPALLocalizationCubit._internal() : super(XPALLocaleInitial());
  static _XPALLocalizationCubit _localizationCubit = _XPALLocalizationCubit();
  static _XPALLocalizationCubit get cubit => _localizationCubit;

  bool _usingHiveStore = false;

  static Future<void> setup({Locale? locale}) async {
    _localizationCubit._locale = locale;
    _localizationCubit._usingHiveStore = (locale == null);
    if (_localizationCubit._usingHiveStore) await XPALHiveManager.setup();
  }

  //MARK: Locale
  Locale? _locale;
  static Locale get locale {
    if (_localizationCubit._usingHiveStore)
      _localizationCubit._locale = XPALHiveManager._get();
    return _localizationCubit._locale ?? Locale('en');
  }

  static set locale(Locale locale) {
    _localizationCubit._locale = locale;
    if (_localizationCubit._usingHiveStore)
      XPALHiveManager._save(locale: locale);
    _localizationCubit.emit(XPALLocaleUpdated(locale));
  }
}

//MARK: State
@immutable
abstract class XPALLocalizationState {}

class XPALLocaleInitial extends XPALLocalizationState {}

class XPALLocaleUpdated extends XPALLocalizationState {
  final Locale updatedLocale;
  XPALLocaleUpdated(this.updatedLocale);
}

//MARK: Hive
bool _isLocaleHiveSetup = false;

class XPALHiveManager {
  static const _boxName =
      'com.xpallocalization.hive.saved_locale.language_code';
  static Box? _box;
  static Future<void> setup() async {
    try {
      await Hive.initFlutter();
      _box = await Hive.openBox<String>(_boxName);
    } on NullThrownError {
    } on MissingPluginException {
    } catch (e) {
      throw FlutterError(e.toString());
    }
    _isLocaleHiveSetup = true;
  }

  static Locale _save({required Locale locale}) {
    if (!_isLocaleHiveSetup)
      throw FlutterError('XPALLocalizationCubit.setupLocalization not called!');
    final String languageCode = locale.languageCode;
    _box?.put(_boxName, languageCode);
    return Locale(languageCode);
  }

  static Locale _get() {
    if (!_isLocaleHiveSetup)
      throw FlutterError('XPALLocalizationCubit.setupLocalization not called!');
    String storedValue =
        _box?.get(_boxName, defaultValue: 'en'); // 'en' - english
    return Locale(storedValue);
  }
}
