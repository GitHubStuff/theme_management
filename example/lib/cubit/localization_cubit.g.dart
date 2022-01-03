// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localization_cubit.dart';

// **************************************************************************
// LocalizeCubitGenerator
// **************************************************************************

class APPLocalizationCubit extends Cubit<APPLocalizationState> {
  static final APPLocalizationCubit _singleton =
      APPLocalizationCubit._internal();
  factory APPLocalizationCubit() => _singleton;
  APPLocalizationCubit._internal() : super(APPLocaleInitial());
  static APPLocalizationCubit _localizationCubit = APPLocalizationCubit();
  static APPLocalizationCubit get cubit => _localizationCubit;

  static Future<void> setup({Locale? locale}) async {
    _localizationCubit._locale = locale;
    _localizationCubit._usingHivePersistence = (locale == null);
    if (_localizationCubit._usingHivePersistence) await APPHiveManager.setup();
  }

  Locale? _locale;
  bool _usingHivePersistence = false;
  Locale get locale {
    if (_localizationCubit._usingHivePersistence)
      _locale = APPHiveManager.get();
    return _locale ?? Locale('en');
  }

  set locale(Locale locale) {
    _locale = locale;
    if (_localizationCubit._usingHivePersistence)
      APPHiveManager.save(locale: locale);
    _localizationCubit.emit(APPLocaleUpdated(locale));
  }
}

//MARK: State
@immutable
abstract class APPLocalizationState {}

class APPLocaleInitial extends APPLocalizationState {}

class APPLocaleUpdated extends APPLocalizationState {
  final Locale updatedLocale;
  APPLocaleUpdated(this.updatedLocale);
}

//MARK: Hive
bool _isLocaleHiveSetup = false;

class APPHiveManager {
  static const _boxName = 'com.applocalization.hive.saved_locale.language_code';
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
      throw FlutterError('APPLocalizationCubit.setupLocalization not called!');
    final String languageCode = locale.languageCode;
    _box?.put(_boxName, languageCode);
    return Locale(languageCode);
  }

  static Locale get() {
    if (!_isLocaleHiveSetup)
      throw FlutterError('APPLocalizationCubit.setupLocalization not called!');
    String storedValue =
        _box?.get(_boxName, defaultValue: 'en'); // 'en' - english
    return Locale(storedValue);
  }
}
