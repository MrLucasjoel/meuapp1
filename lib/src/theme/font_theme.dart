import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {

  static const String primaryFont = 'Roboto';
  static const String secondaryFont = 'Poppins';

  // Getters estáticos para usar direto nos widgets
  static TextStyle get headlineSmall => GoogleFonts.roboto(
    fontSize: 32,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get headlineMedium => GoogleFonts.roboto(
    fontSize: 28,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get headlineLarge => GoogleFonts.roboto(
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get body => GoogleFonts.openSans(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  static TextStyle get button => GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  // Nova fonte roboto
  static TextStyle get montserrat => GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  // Nova fonte Lato
  static TextStyle get lato => GoogleFonts.lato(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
}

class FontTheme {
  static TextTheme get textTheme => TextTheme(
    displayLarge: GoogleFonts.montserrat(fontSize: 57, fontWeight: FontWeight.bold),
    displayMedium: GoogleFonts.montserrat(fontSize: 45, fontWeight: FontWeight.bold),
    displaySmall: GoogleFonts.montserrat(fontSize: 36, fontWeight: FontWeight.bold),
    headlineLarge: AppFonts.headlineLarge,
    headlineMedium: AppFonts.headlineMedium,
    headlineSmall: AppFonts.headlineSmall,
    titleLarge: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w500),
    titleMedium: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
    titleSmall: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),
    bodyLarge: AppFonts.body,
    bodyMedium: GoogleFonts.openSans(fontSize: 14, fontWeight: FontWeight.normal),
    bodySmall: GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.normal),
    labelLarge: AppFonts.button,
    labelMedium: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500),
    labelSmall: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w500),
  );
}
