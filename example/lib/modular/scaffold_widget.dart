import 'package:extensions_package/extensions_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:theme_management/theme_management.dart';
import 'package:xample/localization/dictionary_enum.dart';

import '../cubit/localization_cubit.dart';

class ScaffoldWidget extends StatefulWidget {
  ScaffoldWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _ScaffoldWidget createState() => _ScaffoldWidget();
}

class _ScaffoldWidget extends ObservingStatefulWidget<ScaffoldWidget> {
  String message = 'Tap for Size';
  String instruction = 'Tap + to change the text';
  String instruction2 = 'Tap again';
  bool isFirst = true;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            //ThemeControlWidget(),
          ],
        ),
        body: _body(context),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              isFirst = !isFirst;
              ThemeManagement.darkTheme = isFirst ? DefaultThemes.defaultDarkThemeData() : DefaultThemes.fallbackDarkTheme();
            });
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      );

  Widget _body(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          BlocBuilder<ThemeModeCubit, ThemeModeState>(
              bloc: ThemeManagement.themeModeCubit,
              builder: (_, state) {
                return Text(
                  'ThemeMode: ${ThemeManagement.themeMode.brightnessMode(context).name}',
                  style: TextKey.headline5.textStyle(of: context),
                );
              }),
          Text(
            message,
          ),
          WidgetSize(
            onSizeChange: (Size? size) {
              setState(() {
                message = 'Size - $size';
              });
            },
            child: Text(
              isFirst ? instruction : instruction2,
              style: TextKey.headline4.textStyle(of: context),
            ),
          ),
          SizedBox(height: 24),
          _languageWidget(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => ThemeManagement.themeMode = ThemeMode.dark,
                child: Text('Dark'),
                style: ElevatedButton.styleFrom(
                  primary: ThemeColors(
                    dark: Colors.red,
                    light: Colors.green,
                  ).of(context),
                ),
              ),
              ElevatedButton(
                onPressed: () => ThemeManagement.themeMode = ThemeMode.light,
                child: Text('Light'),
                style: ElevatedButton.styleFrom(
                  primary: ThemeColors(
                    dark: Colors.amber,
                    light: Colors.purple,
                  ).of(context),
                ),
              ),
              ElevatedButton(
                onPressed: () => ThemeManagement.themeMode = ThemeMode.system,
                child: Text('System'),
                style: isFirst
                    ? null
                    : ElevatedButton.styleFrom(
                        primary: ThemeColors(
                          dark: Colors.black,
                          light: Colors.deepOrange,
                        ).of(context),
                      ),
              ),
            ],
          ),
          _modeIcons(),
        ],
      ),
    );
  }

  Widget _languageWidget() {
    APPLocalizationCubit localeCubit = Modular.get<APPLocalizationCubit>();
    return Container(
      child: Column(
        children: [
          Text(APPLocalization.helloWorld.text), //Example of localization
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: () => localeCubit.locale = (Locale('en', '')), child: Text('English')),
              ElevatedButton(onPressed: () => localeCubit.locale = (Locale('es', '')), child: Text('Spanish')),
              ElevatedButton(onPressed: () => localeCubit.locale = (Locale('de', '')), child: Text('German')),
            ],
          ),
        ],
      ),
    ).borderAll(Colors.green).paddingAll(3);
  }

  Widget _modeIcons() {
    return Container(
      child: Wrap(
        spacing: 8.0,
        children: [
          BrightnessType.appDark.icon(context),
          Text(BrightnessType.appDark.name),
          BrightnessType.appLight.icon(context),
          Text(BrightnessType.appLight.name),
          BrightnessType.systemDark.icon(context),
          Text(BrightnessType.systemDark.name),
          BrightnessType.systemLight.icon(context),
          Text(BrightnessType.systemLight.name),
        ],
      ),
    );
  }
}
