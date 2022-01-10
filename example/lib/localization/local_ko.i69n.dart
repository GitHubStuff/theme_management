// ignore_for_file: unused_element, unused_field, camel_case_types, annotate_overrides, prefer_single_quotes
// GENERATED FILE, do not edit!
import 'package:i69n/i69n.dart' as i69n;
import 'local.i69n.dart';

String get _languageCode => 'ko';
String get _localeName => 'ko';

String _plural(int count,
        {String? zero,
        String? one,
        String? two,
        String? few,
        String? many,
        String? other}) =>
    i69n.plural(count, _languageCode,
        zero: zero, one: one, two: two, few: few, many: many, other: other);
String _ordinal(int count,
        {String? zero,
        String? one,
        String? two,
        String? few,
        String? many,
        String? other}) =>
    i69n.ordinal(count, _languageCode,
        zero: zero, one: one, two: two, few: few, many: many, other: other);
String _cardinal(int count,
        {String? zero,
        String? one,
        String? two,
        String? few,
        String? many,
        String? other}) =>
    i69n.cardinal(count, _languageCode,
        zero: zero, one: one, two: two, few: few, many: many, other: other);

class Local_ko extends Local {
  const Local_ko();
  TextLocal_ko get text => TextLocal_ko(this);
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'text':
        return text;
      default:
        return super[key];
    }
  }
}

class TextLocal_ko extends TextLocal {
  final Local_ko _parent;
  const TextLocal_ko(this._parent) : super(_parent);
  String get syncData => "데이터 동기화";
  String get helloWorld => "안녕하세요 월드입니다!";
  String get localization => "한국인";
  String get btnAccept => "동의하기";
  String get btnContinue => "계속하다";
  String get btnOk => "확인";
  String get captionPressToContinue => "계속하려면 누르세요";
  String get btnCancel => "취소";
  String get btnDecline => "감소";
  String get btnDismiss => "해고하다";
  String get captionPdfTitleTerms => "이용약관";
  String get captionDialogTextTerms =>
      "이용약관이 변경되었습니다. 업데이트된 이용약관을 읽고 동의하셔야 합니다.";
  String get about => "에 대한";
  String get aboutInfo => "ΡΑΕΧεάλθ 버전 0.9.0";
  String get accountSettings => "계정 설정";
  String get connectGarmin => "가민 연결";
  String get contactUs => "가민 연결";
  String get language => "언어";
  String get logout => "로그 아웃";
  String get personalInformation => "개인 정보";
  String get theme => "주제";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'syncData':
        return syncData;
      case 'helloWorld':
        return helloWorld;
      case 'localization':
        return localization;
      case 'btnAccept':
        return btnAccept;
      case 'btnContinue':
        return btnContinue;
      case 'btnOk':
        return btnOk;
      case 'captionPressToContinue':
        return captionPressToContinue;
      case 'btnCancel':
        return btnCancel;
      case 'btnDecline':
        return btnDecline;
      case 'btnDismiss':
        return btnDismiss;
      case 'captionPdfTitleTerms':
        return captionPdfTitleTerms;
      case 'captionDialogTextTerms':
        return captionDialogTextTerms;
      case 'about':
        return about;
      case 'aboutInfo':
        return aboutInfo;
      case 'accountSettings':
        return accountSettings;
      case 'connectGarmin':
        return connectGarmin;
      case 'contactUs':
        return contactUs;
      case 'language':
        return language;
      case 'logout':
        return logout;
      case 'personalInformation':
        return personalInformation;
      case 'theme':
        return theme;
      default:
        return super[key];
    }
  }
}
