import '../../../../core/network/dio_client.dart';
import '../models/trip_model.dart';

class TripService {
  final dio = DioClient.dio;

  Future<List<TripModel>> getNearbyTrips(double lat, double lng,
      {double distance = 5}) async {
    final res = await dio.get(
      '/trips/nearby',
      queryParameters: {'lat': lat, 'lng': lng, 'distance': distance},
    );
    final data = res.data['data'];
    if (data is List) {
      return data.map((json) => TripModel.fromJson(json)).toList();
    }
    return [];
  }

  Future<List<TripModel>> searchTrips({
    required String from,
    required String to,
    required DateTime date,
  }) async {
    final res = await dio.get(
      '/trips/available',
      queryParameters: {
        'from': from,
        'to': to,
        'date': date.toIso8601String(),
      },
    );
    final data = res.data['data'];
    if (data is List) {
      return data.map((json) => TripModel.fromJson(json)).toList();
    }
    return [];
  }

  Future<TripModel> getTripById(String tripId) async {
    final res = await dio.get('/trips/$tripId');
    final data = res.data['data'];
    return TripModel.fromJson(data);
  }
}
