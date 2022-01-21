import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../theme_management.dart';

typedef BodyWidget = Widget Function(BuildContext context);

mixin ThemeMixin {
  /// Place in the widget tree for child branches to respond to language changes (or any other cubit),
  /// and change from Dark/Light themes.
  /// NOTE: a typical place for this is right below the scaffold, eg: Scaffold(..,body: themeAndLocale)
  Widget rebuildTreeOnThemeOrCubit<T>({
    Cubit<T>? cubit,
    required BodyWidget bodyWidget,
  }) =>
      (cubit == null)
          ? BlocBuilder(bloc: ThemeManagement.themeModeCubit, builder: (context, _) => bodyWidget(context))
          : BlocBuilder(
              bloc: cubit,
              builder: (_, __) => BlocBuilder(
                bloc: ThemeManagement.themeModeCubit,
                builder: (context, _) => bodyWidget(context),
              ),
            );
}

@Deprecated('Now called "ThemeMixin"')
mixin themeMixin {
  /// Place in the widget tree for child branches to respond to language changes (or any other cubit),
  /// and change from Dark/Light themes.
  /// NOTE: a typical place for this is right below the scaffold, eg: Scaffold(..,body: themeAndLocale)
  Widget rebuildTreeOnThemeOrCubit<T>({
    Cubit<T>? cubit,
    required BodyWidget bodyWidget,
  }) =>
      (cubit == null)
          ? BlocBuilder(bloc: ThemeManagement.themeModeCubit, builder: (context, _) => bodyWidget(context))
          : BlocBuilder(
              bloc: cubit,
              builder: (_, __) => BlocBuilder(
                bloc: ThemeManagement.themeModeCubit,
                builder: (context, _) => bodyWidget(context),
              ),
            );
}
