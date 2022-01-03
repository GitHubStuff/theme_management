// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dictionary_enum.dart';

// **************************************************************************
// LocalizeEnumGenerator
// **************************************************************************

extension PKGLocalizationLookup on PKGLocalization {
  String _lookup(PKGLocalization key, TextLocal text) {
    switch (key) {
      case PKGLocalization.helloWorld:
        return text.helloWorld;
      case PKGLocalization.language:
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

  String get text => byLocale(PKGLocalizationCubit.cubit.locale);
}
