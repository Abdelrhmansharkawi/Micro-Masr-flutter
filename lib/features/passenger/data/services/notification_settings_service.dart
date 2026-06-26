import '../../../../core/network/dio_client.dart';

class NotificationSettingsService {
  final dio = DioClient.dio;

  Future<Map<String, bool>> getSettings() async {
    final response = await dio.get('/users/notification-settings');
    return Map<String, bool>.from(response.data['data']);
  }

  Future<void> updateSettings(Map<String, bool> settings) async {
    await dio.patch('/users/notification-settings', data: settings);
  }
}