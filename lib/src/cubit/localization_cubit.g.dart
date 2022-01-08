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

  bool _usingHiveStore = false;

  static Future<void> setup({Locale? locale}) async {
    _localizationCubit._locale = locale;
    _localizationCubit._usingHiveStore = (locale == null);
    if (_localizationCubit._usingHiveStore) await TMGHiveManager.setup();
  }

  //MARK: Locale
  Locale? _locale;
  static Locale get locale {
    if (_localizationCubit._usingHiveStore)
      _localizationCubit._locale = TMGHiveManager.get();
    return _localizationCubit._locale ?? Locale('en');
  }

  static set locale(Locale locale) {
    _localizationCubit._locale = locale;
    if (_localizationCubit._usingHiveStore) TMGHiveManager.save(locale: locale);
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
