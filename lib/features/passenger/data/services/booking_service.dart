import '../../../../core/network/dio_client.dart';

class BookingService {
  final dio = DioClient.dio;

  Future<List<int>> getBookedSeats(String tripId) async {
    final res = await dio.get('/trips/$tripId/seats');
    final data = res.data['data'];
    final List<dynamic> booked = data['bookedSeats'] ?? [];
    return booked.cast<int>();
  }

  Future<Map<String, dynamic>> createBooking({
    required String tripId,
    required List<int> seats,
    required String pickupName,
    required List<double> pickupCoords,
    required String dropoffName,
    required List<double> dropoffCoords,
  }) async {
    final res = await dio.post('/bookings', data: {
      'tripId': tripId,
      'seats': seats,
      'pickupPoint': {
        'name': pickupName,
        'location': {'coordinates': pickupCoords},
      },
      'dropoffPoint': {
        'name': dropoffName,
        'location': {'coordinates': dropoffCoords},
      },
    });
    return res.data['data'];
  }

  Future<Map<String, dynamic>> payForBooking({
    required String bookingId,
    required String paymentMethodId,
  }) async {
    final res = await dio.post('/bookings/$bookingId/pay', data: {
      'paymentMethodId': paymentMethodId,
    });
    return res.data['data'];
  }

  Future<List<Map<String, dynamic>>> getUserBookings() async {
    try {
      final response = await dio.get('/bookings/my-bookings');
      final data = response.data['data'];


      if (data is! List) return [];

      return data
          .map((e) => e as Map<String, dynamic>?)
          .whereType<Map<String, dynamic>>()
          .toList();
    } catch (e) {
      return [];
    }
  }
}
