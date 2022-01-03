// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localization_cubit.dart';

// **************************************************************************
// LocalizeCubitGenerator
// **************************************************************************

class TMGLocalizationCubit extends Cubit<TMGLocalizationState> {
  static final TMGLocalizationCubit _singleton =
      TMGLocalizationCubit._internal();
  factory TMGLocalizationCubit() => _singleton;
  TMGLocalizationCubit._internal() : super(TMGLocaleInitial());
  static TMGLocalizationCubit _localizationCubit = TMGLocalizationCubit();
  static TMGLocalizationCubit get cubit => _localizationCubit;

  static Future<void> setup({Locale? locale}) async {
    _localizationCubit._locale = locale;
    _localizationCubit._usingHivePersistence = (locale == null);
    if (_localizationCubit._usingHivePersistence) await TMGHiveManager.setup();
  }

  Locale? _locale;
  bool _usingHivePersistence = false;
  Locale get locale {
    if (_localizationCubit._usingHivePersistence)
      _locale = TMGHiveManager.get();
    return _locale ?? Locale('en');
  }

  set locale(Locale locale) {
    _locale = locale;
    if (_localizationCubit._usingHivePersistence)
      TMGHiveManager.save(locale: locale);
    _localizationCubit.emit(TMGLocaleUpdated(locale));
  }
}

//MARK: State
@immutable
abstract class TMGLocalizationState {}

class TMGLocaleInitial extends TMGLocalizationState {}

class TMGLocaleUpdated extends TMGLocalizationState {
  final Locale updatedLocale;
  TMGLocaleUpdated(this.updatedLocale);
}

//MARK: Hive
bool _isLocaleHiveSetup = false;

class TMGHiveManager {
  static const _boxName = 'com.tmglocalization.hive.saved_locale.language_code';
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
      throw FlutterError('TMGLocalizationCubit.setupLocalization not called!');
    final String languageCode = locale.languageCode;
    _box?.put(_boxName, languageCode);
    return Locale(languageCode);
  }

  static Locale get() {
    if (!_isLocaleHiveSetup)
      throw FlutterError('TMGLocalizationCubit.setupLocalization not called!');
    String storedValue =
        _box?.get(_boxName, defaultValue: 'en'); // 'en' - english
    return Locale(storedValue);
  }
}
