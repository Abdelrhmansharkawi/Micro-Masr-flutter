class SavedPlaceModel {
  final String id;
  final String name;
  final String? address;
  final double latitude;
  final double longitude;
  final String type; 

  SavedPlaceModel({
    required this.id,
    required this.name,
    this.address,
    required this.latitude,
    required this.longitude,
    this.type = 'other',
  });

  factory SavedPlaceModel.fromJson(Map<String, dynamic> json) {
    final loc = json['location']['coordinates'] as List;
    return SavedPlaceModel(
      id: json['_id'],
      name: json['name'],
      address: json['address'],
      latitude: (loc[1] as num).toDouble(),
      longitude: (loc[0] as num).toDouble(),
      type: json['type'] ?? 'other',
    );
  }
}
