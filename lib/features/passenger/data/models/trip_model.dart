class TripLocation {
  final String? name;
  final List<double> coordinates; // [lng, lat]

  TripLocation({
    this.name,
    required this.coordinates,
  });

  factory TripLocation.fromJson(Map<String, dynamic>? json) {
    // If the whole object is null, return a default location
    if (json == null) {
      return TripLocation(coordinates: [0, 0]);
    }
    final locationJson = json['location'] as Map<String, dynamic>?;
    final rawCoords = locationJson?['coordinates'] as List<dynamic>?;
    final List<double> coords = rawCoords != null
        ? rawCoords.map((e) => (e as num).toDouble()).toList()
        : [0, 0];

    return TripLocation(
      name: json['name'] as String?,
      coordinates: coords,
    );
  }

  double get latitude => coordinates.length >= 2 ? coordinates[1] : 0.0;
  double get longitude => coordinates.length >= 2 ? coordinates[0] : 0.0;

  @override
  String toString() => 'TripLocation(name: $name, coordinates: $coordinates)';
}

class TripModel {
  final String id;
  final String title;
  final TripLocation startLocation;
  final TripLocation endLocation;
  final DateTime departureTime;
  final double price;
  final int totalSeats;
  final int availableSeats;
  final String status;
  final String driverName;
  final double driverRating;
  final int driverTotalTrips;
  final String? vehiclePlate;
  final List<String> stops;
  final int estimatedDuration;

  TripModel({
    required this.id,
    required this.title,
    required this.startLocation,
    required this.endLocation,
    required this.departureTime,
    required this.price,
    required this.totalSeats,
    required this.availableSeats,
    required this.status,
    required this.driverName,
    required this.driverRating,
    required this.driverTotalTrips,
    this.vehiclePlate,
    this.stops = const [],
    required this.estimatedDuration,
  });

  factory TripModel.fromJson(Map<String, dynamic> json) {
    // Parse driver
    final driverJson = json['driver'] as Map<String, dynamic>?;
    final driverUser = driverJson?['user'] as Map<String, dynamic>?;
    // Parse stops
    final stopsJson = json['stops'] as List<dynamic>?;
    final List<String> stops = stopsJson != null
        ? stopsJson.map((s) => s['name'].toString()).toList()
        : [];

    return TripModel(
      id: json['_id'] as String,
      title: (json['title'] as String?) ?? '',
      startLocation: TripLocation.fromJson(
        json['startLocation'] as Map<String, dynamic>?,
      ),
      endLocation: TripLocation.fromJson(
        json['endLocation'] as Map<String, dynamic>?,
      ),
      departureTime: DateTime.parse(json['departureTime'] as String),
      price: (json['price'] as num).toDouble(),
      totalSeats: (json['totalSeats'] as num?)?.toInt() ?? 0,
      availableSeats: (json['availableSeats'] as num?)?.toInt() ?? 0,
      status: (json['status'] as String?) ?? 'scheduled',
      driverName: driverUser?['fullName'] ?? 'Unknown',
      driverRating: (driverUser?['rating'] as num?)?.toDouble() ?? 0.0,
      driverTotalTrips: (driverJson?['totalTrips'] as num?)?.toInt() ?? 0,
      vehiclePlate: (json['vehicle'] as Map<String, dynamic>?)?['plateNumber'],
      stops: stops,
      estimatedDuration: (json['estimatedDuration'] as num?)?.toInt() ?? 60,
    );
  }

  double get startLat => startLocation.latitude;
  double get startLng => startLocation.longitude;
  String get avatarInitial => driverName.isNotEmpty ? driverName[0] : '?';

  @override
  String toString() =>
      'TripModel(id: $id, title: $title, departure: $departureTime)';
}
