class PopularDestinationModel {
  final String name;
  final String? address;
  final double latitude;
  final double longitude;

  PopularDestinationModel({
    required this.name,
    this.address,
    required this.latitude,
    required this.longitude,
  });

  factory PopularDestinationModel.fromJson(Map<String, dynamic> json) {
    final coords = json['location'] != null
        ? (json['location']['coordinates'] as List)
        : (json['coordinates'] as List);
    return PopularDestinationModel(
      name: json['name'],
      address: json['address'],
      latitude: (coords[1] as num).toDouble(),
      longitude: (coords[0] as num).toDouble(),
    );
  }

  factory PopularDestinationModel.static({
    required String name,
    String? address,
    required double latitude,
    required double longitude,
  }) {
    return PopularDestinationModel(
      name: name,
      address: address,
      latitude: latitude,
      longitude: longitude,
    );
  }
}
