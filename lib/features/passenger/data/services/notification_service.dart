import '../../../../core/network/dio_client.dart';
import '../models/notification_model.dart';

class NotificationService {
  final dio = DioClient.dio;

  Future<int> getUnreadCount() async {
    final res = await dio.get('/notifications/unread-count');
    return res.data['data']['count'] ?? 0;
  }

  Future<List<NotificationModel>> getNotifications() async {
    final res = await dio.get('/notifications');
    final data = res.data['data'];
    if (data is List) {
      return data.map((json) => NotificationModel.fromJson(json)).toList();
    }
    return [];
  }

  Future<void> markAllAsRead() async {
    await dio.patch('/notifications/read');
  }
}
