import 'package:croix_rouge_storage_manager_mobile/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: GoogleFonts.montserrat(
      color: tRedCroixRougeColor,
    ),
    titleLarge: GoogleFonts.montserrat(
        color: Colors.black87,
    ),
    titleMedium: GoogleFonts.montserrat(
        color: Colors.black54,
    ),
    bodyLarge: GoogleFonts.montserrat(
      color: Colors.black87,
    ),
    bodySmall: GoogleFonts.montserrat(
      color: Colors.black54,
    ),
  );
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: GoogleFonts.montserrat(
      color: tRedCroixRougeColor,
    ),
    titleLarge: GoogleFonts.montserrat(
        color: Colors.white70,
    ),
    titleMedium: GoogleFonts.montserrat(
      color: Colors.white70,
    ),
    bodyLarge: GoogleFonts.montserrat(
      color: Colors.white60,
    ),
    bodyMedium: GoogleFonts.montserrat(
      color: Colors.white,
    ),
    bodySmall: GoogleFonts.montserrat(
      color: Colors.white54,
    ),
  );
}