// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'xpal_cubit.dart';

// **************************************************************************
// LocalizeCubitGenerator
// **************************************************************************

class XPALLocalizationCubit extends Cubit<XPALLocalizationState> {
  static final XPALLocalizationCubit _singleton = XPALLocalizationCubit._internal();
  factory XPALLocalizationCubit() => _singleton;
  XPALLocalizationCubit._internal() : super(XPALLocaleInitial());
  static XPALLocalizationCubit _localizationCubit = XPALLocalizationCubit();
  static XPALLocalizationCubit get cubit => _localizationCubit;

  bool _usingHiveStore = false;

  static Future<void> setup({Locale? locale}) async {
    _localizationCubit._locale = locale;
    _localizationCubit._usingHiveStore = (locale == null);
    if (_localizationCubit._usingHiveStore) await XPALHiveManager.setup();
  }

  //MARK: Locale
  Locale? _locale;
  static Locale get locale {
    if (_localizationCubit._usingHiveStore) _localizationCubit._locale = XPALHiveManager.get();
    return _localizationCubit._locale ?? Locale('en');
  }

  static set locale(Locale locale) {
    _localizationCubit._locale = locale;
    if (_localizationCubit._usingHiveStore) XPALHiveManager.save(locale: locale);
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
  static const _boxName = 'com.xpallocalization.hive.saved_locale.language_code';
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

  static Locale save({required Locale locale}) {
    if (!_isLocaleHiveSetup) throw FlutterError('XPALLocalizationCubit.setupLocalization not called!');
    final String languageCode = locale.languageCode;
    _box?.put(_boxName, languageCode);
    return Locale(languageCode);
  }

  static Locale get() {
    if (!_isLocaleHiveSetup) throw FlutterError('XPALLocalizationCubit.setupLocalization not called!');
    String storedValue = _box?.get(_boxName, defaultValue: 'en'); // 'en' - english
    return Locale(storedValue);
  }
}
