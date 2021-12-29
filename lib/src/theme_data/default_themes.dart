import 'package:flutter/material.dart';

import 'text_key.dart';

part 'text_theme_definations.dart';

class DefaultThemes {
  static ThemeData Function() get fallbackDarkTheme => () {
        textColorDarkMode = {
          TextKey.headline1: Colors.red[300]!,
          TextKey.headline2: Colors.red[300]!,
          TextKey.headline3: Colors.red[300]!,
          TextKey.headline4: Colors.red[300]!,
          TextKey.headline5: Colors.red[300]!,
          TextKey.headline6: Colors.red[300]!,
          TextKey.subtitle1: Colors.red[300]!,
          TextKey.subtitle2: Colors.red[300]!,
          TextKey.bodyText1: Colors.red[300]!,
          TextKey.bodyText2: Colors.red[300]!,
          TextKey.button: Colors.red[300]!,
          TextKey.caption: Colors.red[300]!,
          TextKey.overline: Colors.red[300]!,
        };
        return ThemeData(
          appBarTheme: AppBarTheme()
              .copyWith(toolbarTextStyle: TextTheme().merge(_TextThemeDefinations.dark).bodyText1, titleTextStyle: TextTheme().merge(_TextThemeDefinations.dark).headline6),
          brightness: Brightness.dark,
          cardTheme: CardTheme(color: Colors.green[100]),
          floatingActionButtonTheme: FloatingActionButtonThemeData().copyWith(
            foregroundColor: Colors.red[100],
            backgroundColor: Colors.blue[200],
          ),
          iconTheme: IconThemeData().copyWith(color: Colors.blue[300]),
          primaryColor: Colors.red[800],
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
            onSurface: Colors.blueGrey[100],
            primary: Colors.green[400],
          )),
          textTheme: TextTheme().merge(_TextThemeDefinations.dark),
        );
      };

  static ThemeData Function() get defaultDarkThemeData => () {
        textColorDarkMode = {
          TextKey.headline1: Colors.yellow[300]!,
          TextKey.headline2: Colors.yellow[300]!,
          TextKey.headline3: Colors.yellow[300]!,
          TextKey.headline4: Colors.yellow[300]!,
          TextKey.headline5: Colors.yellow[300]!,
          TextKey.headline6: Colors.yellow[300]!,
          TextKey.subtitle1: Colors.yellow[300]!,
          TextKey.subtitle2: Colors.yellow[300]!,
          TextKey.bodyText1: Colors.yellow[300]!,
          TextKey.bodyText2: Colors.yellow[300]!,
          TextKey.button: Colors.yellow[300]!,
          TextKey.caption: Colors.yellow[300]!,
          TextKey.overline: Colors.yellow[300]!
        };
        return ThemeData(
          appBarTheme: AppBarTheme()
              .copyWith(toolbarTextStyle: TextTheme().merge(_TextThemeDefinations.dark).bodyText2, titleTextStyle: TextTheme().merge(_TextThemeDefinations.dark).headline6),
          brightness: Brightness.dark,
          cardTheme: CardTheme(color: Colors.green[800]),
          floatingActionButtonTheme: FloatingActionButtonThemeData().copyWith(
            foregroundColor: Colors.green[50],
            backgroundColor: Colors.green[700],
          ),
          iconTheme: IconThemeData().copyWith(color: Colors.green[300]),
          primaryColor: Colors.green[800],
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
            onSurface: Colors.blueGrey,
            primary: Colors.green[600],
          )),
          textTheme: TextTheme().merge(_TextThemeDefinations.dark),
        );
      };

  static ThemeData get defaultLightThemeData => ThemeData(
        appBarTheme: AppBarTheme(), //.copyWith(textTheme: TextTheme().merge(_TextThemeDefinations.light)),
        brightness: Brightness.light,
        cardTheme: CardTheme(color: Colors.white),
        floatingActionButtonTheme: FloatingActionButtonThemeData().copyWith(),
        iconTheme: IconThemeData().copyWith(color: Colors.blueAccent),
        primaryColor: Colors.blueAccent,
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
          onSurface: Colors.grey,
          primary: Colors.green[600],
        )),
        textTheme: TextTheme().merge(_TextThemeDefinations.light),
      );
}
