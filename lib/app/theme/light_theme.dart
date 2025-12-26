import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

ThemeData buildLightTheme() {
  const appColors = AppColors.light;

  final colorScheme = ColorScheme.light(
    primary: appColors.primary,
    secondary: appColors.secondary,
    tertiary: appColors.tertiary,
    error: appColors.error,
    surface: appColors.secondaryBackground,
    background: appColors.primaryBackground,
    outline: appColors.accent1,
    onPrimary: appColors.info,
    onSecondary: appColors.primaryText,
    onTertiary: appColors.primaryText,
    onSurface: appColors.primaryText,
    onBackground: appColors.primaryText,
    onError: appColors.info,
  );

  final textTheme = GoogleFonts.interTextTheme();

  return ThemeData(
    colorScheme: colorScheme,
    useMaterial3: true,
    scaffoldBackgroundColor: appColors.primaryBackground,
    textTheme: textTheme,
    extensions: const [appColors],
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: appColors.secondaryBackground,
      foregroundColor: appColors.primaryText,
      elevation: 0,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: appColors.accent1),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: appColors.accent1),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: appColors.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: appColors.error),
      ),
      filled: true,
      fillColor: appColors.accent2,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: appColors.secondaryBackground,
      contentTextStyle: TextStyle(color: appColors.primaryText),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: appColors.primary,
        foregroundColor: appColors.info,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );
}

