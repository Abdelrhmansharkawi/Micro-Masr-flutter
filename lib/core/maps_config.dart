/// Google Maps configuration.
///
/// The API key can come from:
/// 1. Backend via [MapsConfigService.init] (preferred in production)
/// 2. `--dart-define=GOOGLE_MAPS_API_KEY=...` at build time
/// 3. Native config in AndroidManifest.xml / iOS AppDelegate (required for the SDK)
class MapsConfig {
  MapsConfig._();

  static const String placeholderKey = 'YOUR_GOOGLE_MAPS_API_KEY_HERE';

  static const String _envKey = String.fromEnvironment('GOOGLE_MAPS_API_KEY');

  static String? _runtimeKey;

  /// Cairo default — used until GPS or trip data is available.
  static const double defaultLat = 30.0444;
  static const double defaultLng = 31.2357;

  static String get apiKey => _runtimeKey ?? _envKey;

  static bool get isConfigured =>
      apiKey.isNotEmpty && apiKey != placeholderKey;

  static void setRuntimeKey(String key) {
    if (key.isNotEmpty) _runtimeKey = key;
  }
}
