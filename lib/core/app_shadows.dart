import 'package:flutter/material.dart';

class AppShadows {
  const AppShadows._();

  static List<BoxShadow> get shadowSm => [
        BoxShadow(
          color: const Color(0xFF000000).withValues(alpha: 0.08),
          offset: const Offset(0, 2),
          blurRadius: 8,
        ),
      ];

  static List<BoxShadow> get shadowMd => [
        BoxShadow(
          color: const Color(0xFF000000).withValues(alpha: 0.12),
          offset: const Offset(0, 4),
          blurRadius: 16,
        ),
      ];

  static List<BoxShadow> get shadowLg => [
        BoxShadow(
          color: const Color(0xFF000000).withValues(alpha: 0.20),
          offset: const Offset(0, 8),
          blurRadius: 24,
        ),
      ];
}











