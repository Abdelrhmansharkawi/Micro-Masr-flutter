import '../../../../core/network/dio_client.dart';
import '../models/tracking_model.dart';

class TrackingService {
  final dio = DioClient.dio;

  Future<TrackingData> getTrackingInfo(String tripId) async {
    final response = await dio.get('/trips/$tripId/track');
    final data = response.data['data'];
    return TrackingData.fromJson(data);
  }

  Future<void> completeTrip(String tripId) async {
    await dio.patch('/trips/$tripId/complete');
  }
}
