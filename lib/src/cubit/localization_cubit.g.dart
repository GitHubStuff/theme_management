// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localization_cubit.dart';

// **************************************************************************
// LocalizeCubitGenerator
// **************************************************************************

class PKGLocalizationCubit extends Cubit<PKGLocalizationState> {
  static final PKGLocalizationCubit _singleton =
      PKGLocalizationCubit._internal();
  factory PKGLocalizationCubit() => _singleton;
  PKGLocalizationCubit._internal() : super(PKGLocaleInitial());
  static PKGLocalizationCubit _localizationCubit = PKGLocalizationCubit();
  static PKGLocalizationCubit get cubit => _localizationCubit;

  static Future<void> setup({Locale? locale}) async {
    _localizationCubit._locale = locale;
    _localizationCubit._usingHivePersistence = (locale == null);
    if (_localizationCubit._usingHivePersistence) await PKGHiveManager.setup();
  }

  Locale? _locale;
  bool _usingHivePersistence = false;
  Locale get locale {
    if (_localizationCubit._usingHivePersistence)
      _locale = PKGHiveManager.get();
    return _locale ?? Locale('en');
  }

  set locale(Locale locale) {
    _locale = locale;
    if (_localizationCubit._usingHivePersistence)
      PKGHiveManager.save(locale: locale);
    _localizationCubit.emit(PKGLocaleUpdated(locale));
  }
}

//MARK: State
@immutable
abstract class PKGLocalizationState {}

class PKGLocaleInitial extends PKGLocalizationState {}

class PKGLocaleUpdated extends PKGLocalizationState {
  final Locale updatedLocale;
  PKGLocaleUpdated(this.updatedLocale);
}

//MARK: Hive
bool _isLocaleHiveSetup = false;

class PKGHiveManager {
  static const _boxName = 'com.pkglocalization.hive.saved_locale.language_code';
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
      throw FlutterError('PKGLocalizationCubit.setupLocalization not called!');
    final String languageCode = locale.languageCode;
    _box?.put(_boxName, languageCode);
    return Locale(languageCode);
  }

  static Locale get() {
    if (!_isLocaleHiveSetup)
      throw FlutterError('PKGLocalizationCubit.setupLocalization not called!');
    String storedValue =
        _box?.get(_boxName, defaultValue: 'en'); // 'en' - english
    return Locale(storedValue);
  }
}
