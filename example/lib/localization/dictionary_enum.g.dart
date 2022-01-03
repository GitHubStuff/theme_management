// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dictionary_enum.dart';

// **************************************************************************
// LocalizeEnumGenerator
// **************************************************************************

extension XYXLocalizationLookup on XYXLocalization {
  String _lookup(XYXLocalization key, TextLocal text) {
    switch (key) {
      case XYXLocalization.helloWorld:
        return text.helloWorld;
      case XYXLocalization.language:
        return text.language;
    }
  }

  String byLanguageCode(String code) {
    switch (code) {
      case 'de':
        return _lookup(this, Local_de().text);
      case 'es':
        return _lookup(this, Local_es().text);
      case 'en':
      default:
        return _lookup(this, Local().text);
    }
  }

  String byLocale(Locale locale) => byLanguageCode(locale.languageCode);

  String get text => byLocale(XYXLocalizationCubit.cubit.locale);
}
