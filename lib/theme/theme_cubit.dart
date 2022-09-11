import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  //intial stage
  ThemeCubit() : super(ThemeMode.system);
//toggle means interchange
  toggleTheme(bool isDarkTheme) {
    if (isDarkTheme) {
      emit(ThemeMode.light);
    } else {
      emit(ThemeMode.dark);
    }
  }

  setTheme(ThemeMode mode) {}
}
