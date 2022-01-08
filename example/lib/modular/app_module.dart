import 'package:flutter_modular/flutter_modular.dart';

import '../cubit/xpal_cubit.dart';
import 'scaffold_widget.dart';

class AppModule extends Module {
  // Provide a list of dependencies to inject into your project
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => XPALLocalizationCubit()),
  ];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => ScaffoldWidget(title: 'theme_management')),
  ];
}
