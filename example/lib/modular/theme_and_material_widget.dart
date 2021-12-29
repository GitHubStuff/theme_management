import 'package:extensions_package/extensions_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:theme_management/theme_management.dart';
import 'package:xample/cubit/locale_cubit.dart';

class ThemeAndMaterialWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _localeWidget();
  }

  /// Widget wrapper to enclose the BlocBuilder that manages state for changing lanaguage/locale
  Widget _localeWidget() {
    LocaleCubit localeCubit = Modular.get<LocaleCubit>();
    Locale? currentLocale;
    return BlocBuilder<LocaleCubit, LocaleState>(
        bloc: localeCubit,
        builder: (_, state) {
          if (state is LocaleInitial) {
            localeCubit.lookupInitialLocale();
          }
          if (state is LocaleUpdated) {
            currentLocale = state.updatedLocale;
          }
          return _materialAppBloc(currentLocale);
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
              AppLocalizations.delegate, //Used to translate strings in /l10n/app_en.arb or /l10n/app_es.arb files
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              const Locale('de', ''), // German, no country code
              const Locale('en', ''), // English, no country code
              const Locale('es', ''), // Spanish, no country code
            ],
          ).modular();
        });
  }
}
