import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color background = Color(0xFF0F172A); // slate 900
  static const Color surface = Color(0xFF1E293B); // slate 800
  static const Color primary = Color(0xFF38BDF8); // sky 400
  static const Color accent = Color(0xFF818CF8); // indigo 400
  static const Color textPrimary = Color(0xFFF8FAFC); // slate 50
  static const Color textSecondary = Color(0xFF94A3B8); // slate 400

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: background,
      primaryColor: primary,
      colorScheme: const ColorScheme.dark(
        primary: primary,
        secondary: accent,
        surface: surface,
      ),
      textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme).copyWith(
        displayLarge: GoogleFonts.outfit(
          color: textPrimary,
          fontWeight: FontWeight.bold,
          fontSize: 64,
        ),
        displayMedium: GoogleFonts.outfit(
          color: textPrimary,
          fontWeight: FontWeight.w700,
          fontSize: 48,
        ),
        titleLarge: GoogleFonts.outfit(
          color: textPrimary,
          fontWeight: FontWeight.w600,
          fontSize: 32,
        ),
        bodyLarge: GoogleFonts.inter(
          color: textPrimary,
          fontSize: 18,
          height: 1.6,
        ),
        bodyMedium: GoogleFonts.inter(
          color: textSecondary,
          fontSize: 16,
          height: 1.5,
        ),
      ),
    );
  }
}
