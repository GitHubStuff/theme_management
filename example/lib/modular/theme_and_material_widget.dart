import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rae_localization_package/rae_localization_package.dart';
import 'package:theme_management/theme_management.dart';

class ThemeAndMaterialWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _builder();
  }

  Widget _builder() => BlocBuilder(
        bloc: RAELanguage.cubit,
        builder: (_, __) => BlocBuilder(
          bloc: ThemeManagement.themeModeCubit,
          builder: (_, state) {
            ThemeMode theState = ThemeManagement.themeMode;
            if (state is ThemeModeUpdate) theState = state.newThemeMode;
            return _materialAppBloc(theState);
          },
        ),
      );

  /// Widget wrapper to enclose switching dark/light mode themes of the MaterialApp
  Widget _materialAppBloc(ThemeMode state) => MaterialApp(
        title: 'Flutter Demo',
        locale: RAELanguage.locale,
        theme: ThemeManagement.lightTheme,
        darkTheme: ThemeManagement.darkTheme,
        themeMode: state,
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
}
