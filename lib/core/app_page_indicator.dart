import 'package:flutter/material.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class AppPageIndicator extends StatelessWidget {
  final PageController controller;
  final int count;
  final double? dotHeight;
  final double? dotWidth;
  final double? spacing;
  final Color? activeDotColor;
  final Color? dotColor;

  const AppPageIndicator({
    super.key,
    required this.controller,
    required this.count,
    this.dotHeight,
    this.dotWidth,
    this.spacing,
    this.activeDotColor,
    this.dotColor,
  });

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: count,
      effect: ExpandingDotsEffect(
        activeDotColor: activeDotColor ?? context.colors.primary,
        dotColor: dotColor ?? context.colors.outline,
        dotHeight: dotHeight ?? 8.ah,
        dotWidth: dotWidth ?? 8.aw,
        expansionFactor: 4,
        spacing: spacing ?? 8.aw,
      ),
    );
  }
}











