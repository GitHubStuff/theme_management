import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rae_assets/rae_assets.dart';
import 'package:rae_widgets/rae_widgets.dart';
import 'package:theme_management/theme_management.dart';

class ThemeAndMaterialWidget extends StatelessWidget with WidgetTreeMixin {
  @override
  Widget build(BuildContext context) => rebuildTreeOnThemeOrLanguageChange(body: _materialAppBloc);

  /// Widget wrapper to enclose switching dark/light mode themes of the MaterialApp
  Widget _materialAppBloc() => MaterialApp(
        title: 'Flutter Demo',
        locale: Language.locale,
        theme: ThemeManagement.lightTheme,
        darkTheme: ThemeManagement.darkTheme,
        themeMode: ThemeManagement.themeMode,
        initialRoute: '/',
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: Language.supportedLocales,
      ).modular();
}
