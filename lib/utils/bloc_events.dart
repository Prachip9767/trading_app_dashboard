// my_bloc.dart

import 'package:flutter/material.dart';

abstract class MyEvent {}
class LoadData extends MyEvent {}

abstract class ThemeEvent {}

class ToggleThemeEvent extends ThemeEvent {}


class ThemeState {
  final ThemeData themeData;

  ThemeState({required this.themeData});
}
