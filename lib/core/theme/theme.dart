import 'package:delishy/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

export 'colors.dart';

final appTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.cambridgeBlue),
  textTheme: TextTheme(
    titleLarge: GoogleFonts.baskervville(
      fontSize: 36,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: GoogleFonts.baskervville(
      fontSize: 28,
      fontWeight: FontWeight.w700,
    ),
    titleSmall: GoogleFonts.baskervville(
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
    displayLarge: GoogleFonts.baskervville(
      fontSize: 48,
      fontWeight: FontWeight.w500,
    ),
    displayMedium: GoogleFonts.baskervville(
      fontSize: 32,
      fontWeight: FontWeight.w500,
    ),
    displaySmall: GoogleFonts.baskervville(
      fontSize: 24,
      fontWeight: FontWeight.w500,
    ),
    labelLarge: GoogleFonts.rubik(
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
  ),
  useMaterial3: true,
);
