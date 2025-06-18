import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:auvnet_task/data/datasources/user_prefs_data_source.dart';
import 'package:auvnet_task/core/theme/themes/dark_theme.dart';
import 'package:auvnet_task/core/theme/themes/light_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_event.dart';


class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  final UserPrefsDataSource _userPrefsDataSource;

  ThemeBloc({required UserPrefsDataSource userPrefsDataSource})
      : _userPrefsDataSource = userPrefsDataSource,
        super(LightTheme.theme) { // Default theme
    on<GetInitialTheme>(_onGetInitialTheme);
    on<ThemeChanged>(_onThemeChanged);
  }

  Future<void> _onGetInitialTheme(
      GetInitialTheme event,
      Emitter<ThemeData> emit,
      ) async {
    final themeName = await _userPrefsDataSource.getTheme();
    if (themeName == 'dark') {
      emit(DarkTheme.theme);
    } else {
      emit(LightTheme.theme);
    }
  }

  Future<void> _onThemeChanged(
      ThemeChanged event,
      Emitter<ThemeData> emit,
      ) async {
    if (event.isDark) {
      emit(DarkTheme.theme);
      await _userPrefsDataSource.cacheTheme('dark');
    } else {
      emit(LightTheme.theme);
      await _userPrefsDataSource.cacheTheme('light');
    }
  }
}