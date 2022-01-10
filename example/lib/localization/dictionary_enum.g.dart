// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dictionary_enum.dart';

// **************************************************************************
// LocalizeEnumGenerator
// **************************************************************************

extension XPALLocalizationLookup on XPALLocalization {
  String _lookup(XPALLocalization key, TextLocal text) {
    switch (key) {
      case XPALLocalization.helloWorld:
        return text.helloWorld;
      case XPALLocalization.language:
        return text.language;
    }
  }

  String byLanguageCode(String code) {
    switch (code) {
      case 'de':
        return _lookup(this, Local_de().text);
      case 'es':
        return _lookup(this, Local_es().text);
      case 'ko':
        return _lookup(this, Local_ko().text);
      case 'en':
      default:
        return _lookup(this, Local().text);
    }
  }

  String byLocale(Locale locale) => byLanguageCode(locale.languageCode);

  String get text => byLocale(XPALLanguage.locale);
}
