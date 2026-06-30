import 'package:google_maps_flutter/google_maps_flutter.dart';

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

  LatLng get latLng => LatLng(latitude, longitude);

  Marker toMarker() {
    return Marker(
      markerId: MarkerId(id),
      position: latLng,
      infoWindow: InfoWindow(title: title),
      icon: BitmapDescriptor.defaultMarkerWithHue(_hue),
    );
  }

  double get _hue {
    switch (type) {
      case MapPinType.driver:
        return BitmapDescriptor.hueOrange;
      case MapPinType.pickup:
        return BitmapDescriptor.hueGreen;
      case MapPinType.dropoff:
        return BitmapDescriptor.hueRed;
      case MapPinType.trip:
        return BitmapDescriptor.hueAzure;
      case MapPinType.user:
        return BitmapDescriptor.hueRose;
    }
  }
}
