import '../../../../core/network/dio_client.dart';

class ReviewService {
  final dio = DioClient.dio;

  Future<void> submitReview({
    required String tripId,
    required int rating,
    required String comment,
    required List<String> tags,
    required double tipAmount,
  }) async {
    await dio.post('/reviews', data: {
      'tripId': tripId,
      'rating': rating,
      'comment': comment,
      'tags': tags,
      'tipAmount': tipAmount,
    });
  }
}
