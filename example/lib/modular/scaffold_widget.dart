import 'package:extensions_package/extensions_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:theme_management/theme_management.dart';
import 'package:xample/cubit/localization_cubit.dart';
import 'package:xample/localization/dictionary_enum.dart';

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
            });
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      );

  Widget _body(BuildContext context) {
    XYXLocalizationCubit localeCubit = Modular.get<XYXLocalizationCubit>();
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          message,
        ),
        WidgetSize(
          onSizeChange: (Size? size) {
            setState(() => message = 'Size - $size');
          },
          child: Text(
            isFirst ? instruction : instruction2,
            style: Theme.of(context).textTheme.headline5,
          ).fontSize(TextKey.subtitle1.fontSize),
        ),
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
              itemCount: XYXLocalization.values.length,
              itemBuilder: (context, index) {
                final tag = XYXLocalization.values[index].name;
                final txt = XYXLocalization.values[index].text;
                return Text('  $tag => $txt').fontSize(18.0);
              }),
        ),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(XYXLocalization.helloWorld.text).fontSize(22.0), //Example of localization
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: () => localeCubit.locale = Locale('en', ''), child: Text('English')),
                  ElevatedButton(onPressed: () => localeCubit.locale = Locale('es', ''), child: Text('Spanish')),
                  ElevatedButton(onPressed: () => localeCubit.locale = Locale('de', ''), child: Text('German')),
                ],
              ),
            ],
          ),
        ).borderAll(Colors.blueAccent).paddingAll(3.0),
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
          ],
        ),
        Row(
          children: [
            BrightnessType.appLight.icon(context).padding(left: 8, right: 6, bottom: 2),
            Text(BrightnessType.appLight.name),
          ],
        ),
        Row(
          children: [
            BrightnessType.systemDark.icon(context).padding(left: 8, right: 6, bottom: 2),
            Text(BrightnessType.systemDark.name),
          ],
        ),
        Row(
          children: [
            BrightnessType.systemLight.icon(context).padding(left: 8, right: 6, bottom: 2),
            Text(BrightnessType.systemLight.name),
          ],
        ),
      ],
    );
  }
}
