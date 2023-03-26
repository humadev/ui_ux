import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@immutable
class AppTheme {
  const AppTheme(this.colorScheme);

  final ColorScheme colorScheme;

  ThemeData toThemeData() {
    return ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme,
        fontFamily: GoogleFonts.openSans().fontFamily,
        // textTheme: textTheme,
        appBarTheme: AppBarTheme(
            backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.onPrimary));
  }
}
