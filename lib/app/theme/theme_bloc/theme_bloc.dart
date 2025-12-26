import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState()) {
    on<ThemeModeChanged>(_onThemeModeChanged);
    on<ThemeToggled>(_onThemeToggled);
  }

  void _onThemeModeChanged(
    ThemeModeChanged event,
    Emitter<ThemeState> emit,
  ) {
    emit(state.copyWith(themeMode: event.themeMode));
  }

  void _onThemeToggled(
    ThemeToggled event,
    Emitter<ThemeState> emit,
  ) {
    ThemeMode nextMode;
    
    if (state.themeMode == ThemeMode.system) {
      // When using system mode, rely on the current brightness to pick the next theme.
      final isCurrentlyDark = event.currentBrightness == Brightness.dark;
      nextMode = isCurrentlyDark ? ThemeMode.light : ThemeMode.dark;
    } else if (state.themeMode == ThemeMode.dark) {
      nextMode = ThemeMode.light;
    } else {
      nextMode = ThemeMode.dark;
    }
    
    emit(state.copyWith(themeMode: nextMode));
  }
}

