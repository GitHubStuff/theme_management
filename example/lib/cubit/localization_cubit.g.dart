// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localization_cubit.dart';

// **************************************************************************
// LocalizeCubitGenerator
// **************************************************************************

class XYXLocalizationCubit extends Cubit<XYXLocalizationState> {
  static final XYXLocalizationCubit _singleton =
      XYXLocalizationCubit._internal();
  factory XYXLocalizationCubit() => _singleton;
  XYXLocalizationCubit._internal() : super(XYXLocaleInitial());
  static XYXLocalizationCubit _localizationCubit = XYXLocalizationCubit();
  static XYXLocalizationCubit get cubit => _localizationCubit;

  static Future<void> setup({Locale? locale}) async {
    _localizationCubit._locale = locale;
    _localizationCubit._usingHivePersistence = (locale == null);
    if (_localizationCubit._usingHivePersistence) await XYXHiveManager.setup();
  }

  Locale? _locale;
  bool _usingHivePersistence = false;
  Locale get locale {
    if (_localizationCubit._usingHivePersistence)
      _locale = XYXHiveManager.get();
    return _locale ?? Locale('en');
  }

  set locale(Locale locale) {
    _locale = locale;
    if (_localizationCubit._usingHivePersistence)
      XYXHiveManager.save(locale: locale);
    _localizationCubit.emit(XYXLocaleUpdated(locale));
  }
}

//MARK: State
@immutable
abstract class XYXLocalizationState {}

class XYXLocaleInitial extends XYXLocalizationState {}

class XYXLocaleUpdated extends XYXLocalizationState {
  final Locale updatedLocale;
  XYXLocaleUpdated(this.updatedLocale);
}

//MARK: Hive
bool _isLocaleHiveSetup = false;

class XYXHiveManager {
  static const _boxName = 'com.xyxlocalization.hive.saved_locale.language_code';
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
    if (!_isLocaleHiveSetup)
      throw FlutterError('XYXLocalizationCubit.setupLocalization not called!');
    final String languageCode = locale.languageCode;
    _box?.put(_boxName, languageCode);
    return Locale(languageCode);
  }

  static Locale get() {
    if (!_isLocaleHiveSetup)
      throw FlutterError('XYXLocalizationCubit.setupLocalization not called!');
    String storedValue =
        _box?.get(_boxName, defaultValue: 'en'); // 'en' - english
    return Locale(storedValue);
  }
}
