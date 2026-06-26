import 'package:flutter/material.dart';
import 'package:micromasr/core/app_color_scheme.dart';

extension AppContextExtensions on BuildContext {
  AppColorScheme get colors => Theme.of(this).extension<AppColorScheme>()!;

  TextTheme get appTextTheme => Theme.of(this).textTheme;

  TextStyle get displayLargeTextStyle => Theme.of(this).textTheme.displayLarge!;
  TextStyle get headlineLargeTextStyle => Theme.of(this).textTheme.headlineLarge!;
  TextStyle get headlineMediumTextStyle => Theme.of(this).textTheme.headlineMedium!;
  TextStyle get titleLargeTextStyle => Theme.of(this).textTheme.titleLarge!;
  TextStyle get titleMediumTextStyle => Theme.of(this).textTheme.titleMedium!;
  TextStyle get titleSmallTextStyle => Theme.of(this).textTheme.titleSmall!;
  TextStyle get bodyLargeTextStyle => Theme.of(this).textTheme.bodyLarge!;
  TextStyle get bodyMediumTextStyle => Theme.of(this).textTheme.bodyMedium!;
  TextStyle get bodySmallTextStyle => Theme.of(this).textTheme.bodySmall!;
  TextStyle get labelLargeTextStyle => Theme.of(this).textTheme.labelLarge!;
  TextStyle get labelMediumTextStyle => Theme.of(this).textTheme.labelMedium!;
  TextStyle get labelSmallTextStyle => Theme.of(this).textTheme.labelSmall!;

  bool get isDark => Theme.of(this).brightness == Brightness.dark;
  MediaQueryData get mq => MediaQuery.of(this);
  Size get screenSize => mq.size;
  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;
  EdgeInsets get padding => mq.padding;
  EdgeInsets get viewInsets => mq.viewInsets;
}











