import 'package:dio/dio.dart';
import '../../../../core/network/dio_client.dart';
import '../models/saved_place_model.dart';

class SavedPlacesService {
  final dio = DioClient.dio;

  Future<List<SavedPlaceModel>> getMyPlaces() async {
    try {
      final response = await dio.get('/places/my-places');
      final list = response.data['data'] as List;
      return list.map((e) => SavedPlaceModel.fromJson(e)).toList();
    } on DioException {
      return [];
    }
  }

  Future<SavedPlaceModel> addPlace({
    required String name,
    String? address,
    required double latitude,
    required double longitude,
    String type = 'other',
  }) async {
    final response = await dio.post(
      '/places',
      data: {
        'name': name,
        'address': address,
        'location': {
          'type': 'Point',
          'coordinates': [longitude, latitude], // GeoJSON: [lng, lat]
        },
        'type': type,
      },
    );
    final data = response.data['data'];
    return SavedPlaceModel.fromJson(data);
  }

  Future<void> deletePlace(String id) async {
    await dio.delete('/places/$id');
  }
}
