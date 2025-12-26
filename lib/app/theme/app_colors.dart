import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  final Color primary;
  final Color secondary;
  final Color tertiary;
  final Color alternate;
  final Color primaryText;
  final Color secondaryText;
  final Color primaryBackground;
  final Color secondaryBackground;
  final Color accent1;
  final Color accent2;
  final Color accent3;
  final Color accent4;
  final Color success;
  final Color warning;
  final Color error;
  final Color info;

  const AppColors({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.alternate,
    required this.primaryText,
    required this.secondaryText,
    required this.primaryBackground,
    required this.secondaryBackground,
    required this.accent1,
    required this.accent2,
    required this.accent3,
    required this.accent4,
    required this.success,
    required this.warning,
    required this.error,
    required this.info,
  });

  static const AppColors light = AppColors(
    primary: Color(0xFF5AB22D),
    secondary: Color(0xFF39D2C0),
    tertiary: Color(0xFFEE8B60),
    alternate: Color(0xFFE0E3E7),
    primaryText: Color(0xFF23293F),
    secondaryText: Color(0xFF6A758D),
    primaryBackground: Color(0xFFF1F4F8),
    secondaryBackground: Color(0xFFFFFFFF),
    accent1: Color(0xFFD9DCE2),
    accent2: Color(0xFFF4F4F4),
    accent3: Color(0xFF6A758D),
    accent4: Color(0xCCFFFFFF),
    success: Color(0xFF249689),
    warning: Color(0xFFF9CF58),
    error: Color(0xFFFF4A4A),
    info: Color(0xFFFFFFFF),
  );

  static const AppColors dark = AppColors(
    primary: Color(0xFF5AB22D),
    secondary: Color(0xFF39D2C0),
    tertiary: Color(0xFFEE8B60),
    alternate: Color(0xFF4A4A4A),
    primaryText: Color(0xFFFFFFFF),
    secondaryText: Color(0xFFB0B0B0),
    primaryBackground: Color(0xFF121212),
    secondaryBackground: Color(0xFF1E1E1E),
    accent1: Color(0xFF3A3A3A),
    accent2: Color(0xFF2A2A2A),
    accent3: Color(0xFF6A758D),
    accent4: Color(0xCC000000),
    success: Color(0xFF249689),
    warning: Color(0xFFF9CF58),
    error: Color(0xFFFF4A4A),
    info: Color(0xFFFFFFFF),
  );

  @override
  ThemeExtension<AppColors> copyWith({
    Color? primary,
    Color? secondary,
    Color? tertiary,
    Color? alternate,
    Color? primaryText,
    Color? secondaryText,
    Color? primaryBackground,
    Color? secondaryBackground,
    Color? accent1,
    Color? accent2,
    Color? accent3,
    Color? accent4,
    Color? success,
    Color? warning,
    Color? error,
    Color? info,
  }) {
    return AppColors(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      tertiary: tertiary ?? this.tertiary,
      alternate: alternate ?? this.alternate,
      primaryText: primaryText ?? this.primaryText,
      secondaryText: secondaryText ?? this.secondaryText,
      primaryBackground: primaryBackground ?? this.primaryBackground,
      secondaryBackground: secondaryBackground ?? this.secondaryBackground,
      accent1: accent1 ?? this.accent1,
      accent2: accent2 ?? this.accent2,
      accent3: accent3 ?? this.accent3,
      accent4: accent4 ?? this.accent4,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      error: error ?? this.error,
      info: info ?? this.info,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }

    return AppColors(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      tertiary: Color.lerp(tertiary, other.tertiary, t)!,
      alternate: Color.lerp(alternate, other.alternate, t)!,
      primaryText: Color.lerp(primaryText, other.primaryText, t)!,
      secondaryText: Color.lerp(secondaryText, other.secondaryText, t)!,
      primaryBackground: Color.lerp(primaryBackground, other.primaryBackground, t)!,
      secondaryBackground: Color.lerp(secondaryBackground, other.secondaryBackground, t)!,
      accent1: Color.lerp(accent1, other.accent1, t)!,
      accent2: Color.lerp(accent2, other.accent2, t)!,
      accent3: Color.lerp(accent3, other.accent3, t)!,
      accent4: Color.lerp(accent4, other.accent4, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      error: Color.lerp(error, other.error, t)!,
      info: Color.lerp(info, other.info, t)!,
    );
  }
}

