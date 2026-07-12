import 'package:micromasr/core/maps_config.dart';
import 'package:micromasr/core/network/dio_client.dart';

/// Fetches Google Maps API key from backend when the endpoint is ready.
class MapsConfigService {
  MapsConfigService._();

  static Future<void> init() async {
    try {
      final response = await DioClient.dio.get('/config/maps');
      final data = response.data;
      final key = data is Map
          ? (data['googleMapsApiKey'] ?? data['apiKey']) as String?
          : null;
      if (key != null && key.isNotEmpty) {
        MapsConfig.setRuntimeKey(key);
      }
    } catch (e) {
      // Temporary print statement to see the exact network failure reason
      print("📍 MapsConfigService Error: $e");
    }
  }
}
