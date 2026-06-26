import 'package:flutter_svg/flutter_svg.dart';

class AssetPreloader {
  const AssetPreloader._();

  static const List<String> _svgAssets = [
    // Icons
    'assets/icons/driver_icon.svg',
    'assets/icons/google_icon.svg',
    'assets/icons/passenger_icon.svg',
    // Images
    'assets/images/Micro Masr App Icon.svg',
    'assets/images/onboarding_1.svg',
    'assets/images/onboarding_2.svg',
    'assets/images/onboarding_3.svg',
    'assets/images/splash_logo.svg',
  ];

  // Preloads all critical SVG assets into the cache.
  // Call this during app initialization or splash screen.
  static Future<void> preloadSVGs() async {
    for (final asset in _svgAssets) {
      final loader = SvgAssetLoader(asset);
      await svg.cache.putIfAbsent(
        loader.cacheKey(null),
        () => loader.loadBytes(null),
      );
    }
  }
}











