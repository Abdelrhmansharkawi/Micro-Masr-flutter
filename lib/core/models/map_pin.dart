enum MapPinType { driver, pickup, dropoff, trip, user }

class MapPin {
  const MapPin({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.type,
    this.title,
  });

  final String id;
  final double latitude;
  final double longitude;
  final MapPinType type;
  final String? title;
}
