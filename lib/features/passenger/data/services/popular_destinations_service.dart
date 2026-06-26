import '../../../../core/network/dio_client.dart';
import '../models/popular_destination_model.dart';

class PopularDestinationsService {
  final dio = DioClient.dio;

  Future<List<PopularDestinationModel>> getPopularDestinations() async {
    try {
      final response = await dio.get('/destinations');
      final list = response.data['data'] as List;
      return list.map((e) => PopularDestinationModel.fromJson(e)).toList();
    } catch (_) {
      // Static fallback when backend is unreachable
      return [
        PopularDestinationModel.static(
            name: 'مطار القاهرة', latitude: 30.1122, longitude: 31.4056),
        PopularDestinationModel.static(
            name: 'الجامعة',
            address: 'جامعة القاهرة',
            latitude: 30.0275,
            longitude: 31.2085),
        PopularDestinationModel.static(
            name: 'محطة مصر',
            address: 'ميدان رمسيس',
            latitude: 30.0636,
            longitude: 31.2484),
      ];
    }
  }
}
