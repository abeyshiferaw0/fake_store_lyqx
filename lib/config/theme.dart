import 'package:fake_store_lyqx/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,

      // Button Theme
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.blue,
        textTheme: ButtonTextTheme.primary,
      ),

      // Text Theme
      textTheme: TextTheme(
        labelSmall: GoogleFonts.urbanist(
          fontSize: AppConstants.sp_10,
          color: AppColors.bodyTextColor,
        ),
        labelMedium: GoogleFonts.urbanist(
          fontSize: AppConstants.sp_12,
          color: AppColors.bodyTextColor,
        ),
        labelLarge: GoogleFonts.urbanist(
          fontSize: AppConstants.sp_14,
          color: AppColors.bodyTextColor,
        ),
        bodySmall: GoogleFonts.urbanist(
          fontSize: AppConstants.sp_12,
          color: AppColors.bodyTextColor,
        ),
        bodyMedium: GoogleFonts.urbanist(
          fontSize: AppConstants.sp_14,
          color: AppColors.bodyTextColor,
        ),
        bodyLarge: GoogleFonts.urbanist(
          fontSize: AppConstants.sp_16,
          color: AppColors.bodyTextColor,
        ),
        displaySmall: GoogleFonts.urbanist(
          fontSize: AppConstants.sp_12,
          color: AppColors.bodyTextColor,
        ),
        displayMedium: GoogleFonts.urbanist(
          fontSize: AppConstants.sp_24,
          color: AppColors.bodyTextColor,
        ),
        displayLarge: GoogleFonts.urbanist(
          fontSize: AppConstants.sp_28,
          color: AppColors.bodyTextColor,
        ),
      ),

      //Text input decoration
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        labelStyle: TextStyle(
          color: Colors.blue,
        ),
      ),

      // Bottom Navigation Bar Theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
      ),
    );
  }
}
