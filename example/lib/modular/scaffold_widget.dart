import 'package:extensions_package/extensions_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_management/theme_management.dart';
import 'package:xample/localization/dictionary_enum.dart';
import 'package:xample/localization/xpal_cubit.dart';

class ScaffoldWidget extends StatefulWidget {
  ScaffoldWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _ScaffoldWidget createState() => _ScaffoldWidget();
}

class _ScaffoldWidget extends ObservingStatefulWidget<ScaffoldWidget> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            //ThemeControlWidget(),
          ],
        ),
        body: _rebuild(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {});
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      );

  Widget _rebuild() {
    return BlocBuilder(
        bloc: ThemeManagement.themeModeCubit,
        builder: (context, state) {
          return BlocBuilder(
              bloc: XPALLanguage.cubit,
              builder: (context, state) {
                return _body(context);
              });
        });
  }

  Widget _body(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(XPALLocalization.helloWorld.text).fontSize(22.0), //Example of localization
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: () => XPALLanguage.locale = Locale('en'), child: Text('English')),
                  ElevatedButton(onPressed: () => XPALLanguage.locale = Locale('es'), child: Text('Spanish')),
                  ElevatedButton(onPressed: () => XPALLanguage.locale = Locale('de'), child: Text('German')),
                  ElevatedButton(onPressed: () => XPALLanguage.locale = Locale('ko'), child: Text('Korean')),
                ],
              ),
            ],
          ),
        ).borderAll(Colors.blueAccent).paddingAll(3.0),
        SizedBox(height: 4),
        Container(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              children: [
                BlocBuilder<ThemeModeCubit, ThemeModeState>(
                    bloc: ThemeManagement.themeModeCubit,
                    builder: (_, state) {
                      return Text('ThemeMode: ${ThemeManagement.themeMode.brightnessMode(context).name}').fontSize(TextKey.headline6.fontSize);
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(onPressed: () => ThemeManagement.themeMode = ThemeMode.dark, child: Text('Dark')),
                    ElevatedButton(onPressed: () => ThemeManagement.themeMode = ThemeMode.light, child: Text('Light')),
                    ElevatedButton(onPressed: () => ThemeManagement.themeMode = ThemeMode.system, child: Text('System')),
                  ],
                ),
                _themeIcons(),
              ],
            ),
          ),
        )
            .borderAll(
              ThemeColors(
                dark: Colors.amber,
                light: Colors.black87,
              ).of(context),
            )
            .paddingAll(3.0),
        SizedBox(height: 4),
        Expanded(
          flex: 2,
          child: ListView.builder(
              itemCount: XPALLocalization.values.length,
              itemBuilder: (context, index) {
                final tag = XPALLocalization.values[index].name;
                final txt = XPALLocalization.values[index].text;
                return Text('  $tag => $txt').fontSize(18.0);
              }),
        ),
        SizedBox(height: 72.0),
      ],
    );
  }

  Widget _themeIcons() {
    return Column(
      children: [
        Row(
          children: [
            BrightnessType.appDark.icon(context).padding(left: 8, right: 6, bottom: 2),
            Text(BrightnessType.appDark.name),
            BrightnessType.appLight.icon(context).padding(left: 8, right: 6, bottom: 2),
            Text(BrightnessType.appLight.name),
          ],
        ),
        Row(
          children: [
            BrightnessType.systemDark.icon(context).padding(left: 8, right: 6, bottom: 2),
            Text(BrightnessType.systemDark.name),
            BrightnessType.systemLight.icon(context).padding(left: 8, right: 6, bottom: 2),
            Text(BrightnessType.systemLight.name),
          ],
        ),
      ],
    );
  }
}
