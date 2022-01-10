import 'package:extensions_package/extensions_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:theme_management/theme_management.dart';
import 'package:xample/localization/xpal_cubit.dart';

class ThemeAndMaterialWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _localeWidget();
  }

  /// Widget wrapper to enclose the BlocBuilder that manages state for changing lanaguage/locale
  Widget _localeWidget() {
    return BlocBuilder(
        bloc: XPALLanguage.cubit,
        builder: (_, state) {
          return _materialAppBloc(XPALLanguage.locale);
        });
  }

  /// Widget wrapper to enclose switching dark/light mode themes of the MaterialApp
  Widget _materialAppBloc(Locale? locale) {
    var darkTheme = ThemeManagement.darkTheme;
    var lightTheme = ThemeManagement.lightTheme;
    return BlocBuilder<ThemeModeCubit, ThemeModeState>(
        bloc: ThemeManagement.themeModeCubit,
        builder: (context, state) {
          if (state is ChangeThemeState) {
            final mode = state.mode;
            switch (mode) {
              case ThemeMode.dark:
                darkTheme = state.themeData;
                break;
              case ThemeMode.light:
                lightTheme = state.themeData;
                break;
              case ThemeMode.system:
                switch (mode.of(context)) {
                  case Brightness.light:
                    lightTheme = state.themeData;
                    break;
                  case Brightness.dark:
                    darkTheme = state.themeData;
                }
            }
          }
          return MaterialApp(
            title: 'Flutter Demo',
            locale: locale,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeManagement.themeMode,
            initialRoute: '/',
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              const Locale('de'), // German, no country code
              const Locale('en'), // English, no country code
              const Locale('es'), // Spanish, no country code
              const Locale('ko'), // Korean, no country code
            ],
          ).modular();
        });
  }
}
