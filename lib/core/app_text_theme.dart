import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  const AppTextTheme._();

  static TextTheme get textTheme => TextTheme(
        displayLarge: GoogleFonts.cairo(
          fontSize: 32.sp,
          fontWeight: FontWeight.w700,
          height: 1.2,
        ),
        headlineLarge: GoogleFonts.cairo(
          fontSize: 24.sp,
          fontWeight: FontWeight.w700,
          height: 1.3,
        ),
        headlineMedium: GoogleFonts.cairo(
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          height: 1.3,
        ),
        titleLarge: GoogleFonts.cairo(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          height: 1.4,
        ),
        titleMedium: GoogleFonts.cairo(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          height: 1.4,
        ),
        bodyLarge: GoogleFonts.cairo(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          height: 1.5,
        ),
        bodyMedium: GoogleFonts.cairo(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          height: 1.5,
        ),
        bodySmall: GoogleFonts.cairo(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          height: 1.5,
        ),
        labelLarge: GoogleFonts.cairo(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          height: 1.2,
        ),
        labelSmall: GoogleFonts.cairo(
          fontSize: 11.sp,
          fontWeight: FontWeight.w500,
          height: 1.2,
        ),
      );
}
