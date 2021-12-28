/*
If errors like ```Traget URI doesn't...``` or ```Undefined name 'AppLocalizations'``` Reload the Dart Analyzer

1) Open the Command Palette (Ctrl+Shift+P)
2) Enter and select ```Developer: Reload Window```
*/

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:theme_management/theme_management.dart';

mixin DictionaryEnumMixin {
  String lookup(DictionaryEnum item, {required BuildContext of}) {
    switch (item) {
      case DictionaryEnum.helloWorld:
        return AppLocalizations.of(of)!.helloWorld;
    }
  }
}
