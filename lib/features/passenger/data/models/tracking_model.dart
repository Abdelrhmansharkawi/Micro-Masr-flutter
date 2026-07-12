class VehicleTracking {
  final String plateNumber;
  final String model;
  final String color;

  VehicleTracking({
    required this.plateNumber,
    required this.model,
    required this.color,
  });

  factory VehicleTracking.fromJson(Map<String, dynamic> json) {
    return VehicleTracking(
      plateNumber: json['plateNumber'] ?? '',
      model: json['model'] ?? '',
      color: json['color'] ?? '',
    );
  }
}

class DriverTracking {
  final String fullName;
  final String phone;
  final double rating;
  final VehicleTracking vehicle;

  DriverTracking({
    required this.fullName,
    required this.phone,
    required this.rating,
    required this.vehicle,
  });

  factory DriverTracking.fromJson(Map<String, dynamic> json) {
    return DriverTracking(
      fullName: json['fullName'] ?? '',
      phone: json['phone'] ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      vehicle: VehicleTracking.fromJson(json['vehicle']),
    );
  }
}

class BookingTracking {
  final double totalPrice;
  final String currency;

  BookingTracking({
    required this.totalPrice,
    required this.currency,
  });

  factory BookingTracking.fromJson(Map<String, dynamic> json) {
    return BookingTracking(
      totalPrice: (json['totalPrice'] as num).toDouble(),
      currency: json['currency'] ?? 'EGP',
    );
  }
}

class LocationPoint {
  final double latitude;
  final double longitude;

  LocationPoint({required this.latitude, required this.longitude});

  factory LocationPoint.fromJson(Map<String, dynamic> json) {
    // FIXED: Defensive parsing to prevent RangeError crashing if backend coordinates are empty
    final coords = json['coordinates'] as List<dynamic>?;
    if (coords == null || coords.length < 2) {
      return LocationPoint(latitude: 0.0, longitude: 0.0);
    }
    return LocationPoint(
      latitude: (coords[1] as num).toDouble(),
      longitude: (coords[0] as num).toDouble(),
    );
  }
}

class TrackingData {
  final String tripId;
  final DriverTracking driver;
  final BookingTracking booking;
  final String currentStep; // 'onWay','arrived','inTrip','reached'
  final int remainingMinutes;
  final LocationPoint driverLocation;
  final LocationPoint? pickupLocation;
  final LocationPoint? dropoffLocation;

  TrackingData({
    required this.tripId,
    required this.driver,
    required this.booking,
    required this.currentStep,
    required this.remainingMinutes,
    required this.driverLocation,
    this.pickupLocation,
    this.dropoffLocation,
  });

  factory TrackingData.fromJson(Map<String, dynamic> json) {
    return TrackingData(
      tripId: json['tripId'],
      driver: DriverTracking.fromJson(json['driver']),
      booking: BookingTracking.fromJson(json['booking']),
      currentStep: json['currentStep'] ?? 'onWay',
      remainingMinutes: (json['remainingMinutes'] as num?)?.toInt() ?? 0,
      driverLocation: LocationPoint.fromJson(json['driverLocation']),
      pickupLocation: json['pickupPoint'] != null
          ? LocationPoint.fromJson(json['pickupPoint']['location'])
          : null,
      dropoffLocation: json['dropoffPoint'] != null
          ? LocationPoint.fromJson(json['dropoffPoint']['location'])
          : null,
    );
  }
}
