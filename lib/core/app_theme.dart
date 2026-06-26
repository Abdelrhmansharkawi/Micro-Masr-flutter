import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_color_scheme.dart';
import 'app_text_theme.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData light = _buildTheme(AppColorScheme.light, Brightness.light);
  static ThemeData dark = _buildTheme(AppColorScheme.dark, Brightness.dark);

  static ThemeData _buildTheme(AppColorScheme colors, Brightness brightness) {
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      fontFamily: GoogleFonts.cairo().fontFamily,
      textTheme: AppTextTheme.textTheme,
      scaffoldBackgroundColor: colors.background,
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: colors.primary,
        onPrimary: colors.onPrimary,
        primaryContainer: colors.primaryContainer,
        onPrimaryContainer: colors.primary,
        secondary: colors.secondary,
        onSecondary: colors.onPrimary,
        secondaryContainer: colors.primaryContainer,
        onSecondaryContainer: colors.primary,
        surface: colors.surface,
        onSurface: colors.onSurface,
        error: colors.error,
        onError: colors.onPrimary,
        outline: colors.outline,
        shadow: brightness == Brightness.light
            ? const Color(0x14000000)
            : const Color(0x33000000),
        scrim: colors.scrim,
      ),
      extensions: [colors],
      appBarTheme: AppBarTheme(
        backgroundColor: colors.surface,
        foregroundColor: colors.onSurface,
        elevation: 0,
        scrolledUnderElevation: 1,
        centerTitle: true,
        titleTextStyle: GoogleFonts.cairo(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: colors.onSurface,
        ),
      ),
      dividerTheme: DividerThemeData(
        color: colors.outline,
        thickness: 1,
        space: 1,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }
}











