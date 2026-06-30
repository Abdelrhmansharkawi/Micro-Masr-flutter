import 'package:geolocator/geolocator.dart';
import 'package:micromasr/core/maps_config.dart';

class AppLocation {
  const AppLocation({required this.latitude, required this.longitude});
  final double latitude;
  final double longitude;
}

class LocationService {
  LocationService._();

  static Future<bool> _ensurePermission() async {
    if (!await Geolocator.isLocationServiceEnabled()) return false;

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    return permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
  }

  static Future<AppLocation?> getCurrentLocation() async {
    try {
      if (!await _ensurePermission()) return null;
      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );
      return AppLocation(
        latitude: position.latitude,
        longitude: position.longitude,
      );
    } catch (_) {
      return null;
    }
  }

  static AppLocation get defaultLocation => const AppLocation(
        latitude: MapsConfig.defaultLat,
        longitude: MapsConfig.defaultLng,
      );

  static Future<AppLocation> getLocationOrDefault() async {
    return await getCurrentLocation() ?? defaultLocation;
  }
}
