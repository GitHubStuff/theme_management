import 'package:flutter/material.dart';
import 'package:localize_enum_annotation/localize_enum_annotation.dart';

import '../cubit/xpal_cubit.dart';
import 'local.i69n.dart';
import 'local_de.i69n.dart';
import 'local_es.i69n.dart';

part 'dictionary_enum.g.dart';

@localizeEnum
enum XPALLocalization {
  helloWorld,
  language,
}
