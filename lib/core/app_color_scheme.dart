import 'package:flutter/material.dart';

class AppColorScheme extends ThemeExtension<AppColorScheme> {
  const AppColorScheme({
    required this.primary,
    required this.primaryLight,
    required this.primaryContainer,
    required this.onPrimary,
    required this.secondary,
    required this.surface,
    required this.background,
    required this.onBackground,
    required this.onSurface,
    required this.textSecondary,
    required this.outline,
    required this.error,
    required this.success,
    required this.warning,
    required this.seatOccupied,
    required this.seatSelected,
    required this.seatAvailable,
    required this.scrim,
  });

  final Color primary;
  final Color primaryLight;
  final Color primaryContainer;
  final Color onPrimary;
  final Color secondary;
  final Color surface;
  final Color background;
  final Color onBackground;
  final Color onSurface;
  final Color textSecondary;
  final Color outline;
  final Color error;
  final Color success;
  final Color warning;
  final Color seatOccupied;
  final Color seatSelected;
  final Color seatAvailable;
  final Color scrim;

  static const AppColorScheme light = AppColorScheme(
    primary: Color(0xFF1F6B35),
    primaryLight: Color(0xFF2E7D32),
    primaryContainer: Color(0xFFE8F5E9),
    onPrimary: Color(0xFFFFFFFF),
    secondary: Color(0xFF4CAF50),
    surface: Color(0xFFFFFFFF),
    background: Color(0xFFF5F7F5),
    onBackground: Color(0xFF1A1A1A),
    onSurface: Color(0xFF1A1A1A),
    textSecondary: Color(0xFF757575),
    outline: Color(0xFFE0E0E0),
    error: Color(0xFFB00020),
    success: Color(0xFF388E3C),
    warning: Color(0xFFF57C00),
    seatOccupied: Color(0xFFBDBDBD),
    seatSelected: Color(0xFF1F6B35),
    seatAvailable: Color(0xFFE8F5E9),
    scrim: Color(0x80000000),
  );

  static const AppColorScheme dark = AppColorScheme(
    primary: Color(0xFF4CAF50),
    primaryLight: Color(0xFF66BB6A),
    primaryContainer: Color(0xFF1B5E20),
    onPrimary: Color(0xFF000000),
    secondary: Color(0xFF81C784),
    surface: Color(0xFF1E1E1E),
    background: Color(0xFF121212),
    onBackground: Color(0xFFE0E0E0),
    onSurface: Color(0xFFE0E0E0),
    textSecondary: Color(0xFF9E9E9E),
    outline: Color(0xFF424242),
    error: Color(0xFFCF6679),
    success: Color(0xFF66BB6A),
    warning: Color(0xFFFFB74D),
    seatOccupied: Color(0xFF616161),
    seatSelected: Color(0xFF4CAF50),
    seatAvailable: Color(0xFF1B5E20),
    scrim: Color(0x80000000),
  );

  @override
  AppColorScheme copyWith({
    Color? primary,
    Color? primaryLight,
    Color? primaryContainer,
    Color? onPrimary,
    Color? secondary,
    Color? surface,
    Color? background,
    Color? onBackground,
    Color? onSurface,
    Color? textSecondary,
    Color? outline,
    Color? error,
    Color? success,
    Color? warning,
    Color? seatOccupied,
    Color? seatSelected,
    Color? seatAvailable,
    Color? scrim,
  }) {
    return AppColorScheme(
      primary: primary ?? this.primary,
      primaryLight: primaryLight ?? this.primaryLight,
      primaryContainer: primaryContainer ?? this.primaryContainer,
      onPrimary: onPrimary ?? this.onPrimary,
      secondary: secondary ?? this.secondary,
      surface: surface ?? this.surface,
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
      onSurface: onSurface ?? this.onSurface,
      textSecondary: textSecondary ?? this.textSecondary,
      outline: outline ?? this.outline,
      error: error ?? this.error,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      seatOccupied: seatOccupied ?? this.seatOccupied,
      seatSelected: seatSelected ?? this.seatSelected,
      seatAvailable: seatAvailable ?? this.seatAvailable,
      scrim: scrim ?? this.scrim,
    );
  }

  @override
  AppColorScheme lerp(ThemeExtension<AppColorScheme>? other, double t) {
    if (other is! AppColorScheme) return this;
    return AppColorScheme(
      primary: Color.lerp(primary, other.primary, t)!,
      primaryLight: Color.lerp(primaryLight, other.primaryLight, t)!,
      primaryContainer: Color.lerp(primaryContainer, other.primaryContainer, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      background: Color.lerp(background, other.background, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      outline: Color.lerp(outline, other.outline, t)!,
      error: Color.lerp(error, other.error, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      seatOccupied: Color.lerp(seatOccupied, other.seatOccupied, t)!,
      seatSelected: Color.lerp(seatSelected, other.seatSelected, t)!,
      seatAvailable: Color.lerp(seatAvailable, other.seatAvailable, t)!,
      scrim: Color.lerp(scrim, other.scrim, t)!,
    );
  }
}











