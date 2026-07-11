import 'package:abdullah_portfolio/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


abstract final class AppTextStyles {
  AppTextStyles._();

  static TextStyle get h1 => GoogleFonts.workSans(
        fontSize: 72,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
      );

  static TextStyle get h2 => GoogleFonts.workSans(
        fontSize: 48,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
      );

  static TextStyle get h3 => GoogleFonts.workSans(
        fontSize: 38,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      );

  static TextStyle get title => GoogleFonts.workSans(
        fontSize: 24,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get body => GoogleFonts.workSans(
        fontSize: 18,
        color: AppColors.textSecondary,
      );

  static TextStyle get bodySmall => GoogleFonts.workSans(
        fontSize: 16,
        color: AppColors.textLight,
      );

  static TextStyle get button => GoogleFonts.workSans(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      );
}