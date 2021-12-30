# theme_management

This package is to manage dark/light modes for app. There are effectively four(4) modes:

1) System-Dark   - when the device is set to dark mode
2) System-Light  - when the device is set to light mode
3) Application-Dark - when the device setting is overridden and the app is dark mode
4) Application-Light - when the device setting is overriden and the app is in light mode

Apps can set their mode, and it will be persisted between runs {using a [hive_flutter](https://pub.dev/packages/hive_flutter) on device store}.

Changes in mode are reflected in the app at run time (no need to restart the app for theme to change to take effect)

## Install

```text
dependencies:
  theme_management:
    git:
      url: https://github.com/GitHubStuff/theme_management.git
```

***- OR -***

```text
dependencies:
  theme_management:
    git:
      url: https://github.com/RAE-Health/theme_management.git
```

## Import

```dart
import 'package:theme_management/theme_management.dart';
```

## Language errors because Dart Analyzer crashed on VSCode

If errors like ```Traget URI doesn't...``` or ```Undefined name 'AppLocalizations'``` Reload the Dart Analyzer

1) Open the Command Palette (Ctrl+Shift+P)
2) Enter and select ```Developer: Reload Window```

## Usage

### Colors

Colors need to have two(2) values:

1) A dark mode color
2) A light mode color

```dart
class ThemeColors {
  final Color dark;
  final Color light;
  const ThemeColors({required this.dark, required this.light});
  // returns dark/light color based on the app-preference (system, light, dark)
  Color of(BuildContext context)
  factory ThemeColors.mono({required Color color})
}
```

The concept is to have a color-design that responds to any change in them, and to have mode-design in place at the start
development.

### Setup

To persist (dark/light)-mode state, a [hive_flutter](https://pub.dev/packages/hive_flutter) storage system used, requiring that hive be first initialized at the start of the app

*Example:*

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Enable theme changes/monitoring by creating a 'hive' object to persist information
  await ThemeManagement.setup();
```

The (dark/light)-mode state is managed using [BLoC](https://pub.dev/packages/flutter_bloc) with Cubit-pattern. This requires the Material-App widget be wrapped by a BlocBuilder so that changes in mode reflect instantly.

*Example:*

see [example/lib/modular/theme_and_material_widget.dart](/example/lib/modular/theme_and_material_widget.dart)

***HINT*** The example app will show the features of ThemeManagement

### Examples

Change Mode:

```dart
/// To change to various modes -
ThemeManagement.themeMode = ThemeMode.dark;
ThemeManagement.themeMode = ThemeMode.light;
ThemeManagement.themeMode = ThemeMode.system;
```

Set Theme Data properties

```dart
ThemeManagement.darkTheme = ThemeData(.....);
ThemeManagement.lightTheme = ThemeData(.....);
```

The Goggle material design uses [TextTheme class](https://api.flutter.dev/flutter/material/TextTheme-class.html) to define a collection of categories for different styles. This packages uses an enum defined:

```dart
enum TextKey {
  headline1,
  headline2,
  headline3,
  headline4,
  headline5,
  headline6,
  subtitle1,
  subtitle2,
  bodyText1,
  bodyText2,
  caption,
  button,
  overline,
}

/// Base on the TextKey a TextStyle can be derived using:
TextStyle textStyle({required BuildContext of});

///Example
final style = TextKey.headline1.textStyle(of: context);
// The widget will be correctly sized, text colors to match (dark/light)-mode
final widge = Text('A headline1!', style: style);
```

There are ```Map<TextKey, ?>``` values:

```dart
Map<TextKey, double> textSizeMap;     // the [font]Size of text
Map<TextKey, Color> textColorLightMode // for the [font]Color for light mode
Map<TextKey, Color> textColorDarkMode  // for the [font]Color for dark mode

///Example
// To make TextKey.headline1 have a fontsize of 56.0, and display Colors.green for dark-mode,
// and Colors.red for light-mode
textSizeMap[TextKey.headline1] = 56.0;
textColorDarkMode[TextKey.headline1] = Colors.green;
textColorLightMode[TextKey.headline1] = Colors.red;
textColorDarkMode[TextKey.headline1] = Colors.green;
```

***NOTE*** such a change will carry forward-and-back to any widget using TextKey.headline1

## Testing

To create unit and widget tests, [hive_flutter](https://pub.dev/packages/hive_flutter) ***CAN NOT*** be used as it has no area in test environment to create its store.

Suppling a [ThemeMode](https://api.flutter.dev/flutter/material/ThemeMode.html) at set up with by-pass [hive_flutter](https://pub.dev/packages/hive_flutter) and not persist state between test runs.

```dart
ThemeManager.setup(ThemeMode.dark);
- OR -
ThemeManager.setup(ThemeMode.light);
- OR -
ThemeManager.setup(ThemeMode.system);
```

\- ***WARNING*** -

```dart
/// This will hang Test
ThemeManager.setup();
```

## Final Note

Be kind to each other
