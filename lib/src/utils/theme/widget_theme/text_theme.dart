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
    titleSmall: GoogleFonts.montserrat(
      color: Colors.black54,
    ),
    bodyLarge: GoogleFonts.montserrat(
      color: Colors.black87,
    ),
    bodyMedium: GoogleFonts.montserrat(
      color: Colors.black54,
    ),
    bodySmall: GoogleFonts.montserrat(
      color: Colors.black54,
    ),
    labelLarge: GoogleFonts.montserrat(
      color: Colors.black54,
    ),
    labelMedium: GoogleFonts.montserrat(
      color: Colors.black54,
    ),
    labelSmall: GoogleFonts.montserrat(
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
    titleSmall: GoogleFonts.montserrat(
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
    labelLarge: GoogleFonts.montserrat(
      color: Colors.white54,
    ),
    labelMedium: GoogleFonts.montserrat(
      color: Colors.white54,
    ),
    labelSmall: GoogleFonts.montserrat(
      color: Colors.white54,
    ),
  );
}
