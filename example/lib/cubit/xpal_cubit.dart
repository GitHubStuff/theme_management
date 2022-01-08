import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:localize_enum_annotation/localize_enum_annotation.dart';

part 'xpal_cubit.g.dart';

@LocalizeCubit('XPAL', 'XPALLocalization')
abstract class Template {}
