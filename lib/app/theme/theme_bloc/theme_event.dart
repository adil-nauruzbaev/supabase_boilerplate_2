import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object?> get props => [];
}

class ThemeModeChanged extends ThemeEvent {
  const ThemeModeChanged(this.themeMode);

  final ThemeMode themeMode;

  @override
  List<Object?> get props => [themeMode];
}

class ThemeToggled extends ThemeEvent {
  const ThemeToggled({this.currentBrightness});

  final Brightness? currentBrightness;

  @override
  List<Object?> get props => [currentBrightness];
}

