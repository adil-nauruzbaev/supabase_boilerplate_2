import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

ThemeData buildDarkTheme() {
  const appColors = AppColors.dark;

  final textTheme = GoogleFonts.interTextTheme(ThemeData.dark().textTheme);

  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: appColors.primary,
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
    textTheme: textTheme,
    extensions: const [appColors],
    appBarTheme: const AppBarTheme(
      centerTitle: true,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
    ),
  );
}

