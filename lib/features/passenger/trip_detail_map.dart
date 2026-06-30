import 'package:flutter/material.dart';
import 'package:micromasr/core/models/map_pin.dart';
import 'package:micromasr/core/widgets/live_trip_map.dart';

class TripDetailMap extends StatelessWidget {
  const TripDetailMap({
    super.key,
    this.startLat,
    this.startLng,
    this.endLat,
    this.endLng,
  });

  final double? startLat;
  final double? startLng;
  final double? endLat;
  final double? endLng;

  @override
  Widget build(BuildContext context) {
    final pins = <MapPin>[
      if (startLat != null && startLng != null)
        MapPin(
          id: 'start',
          latitude: startLat!,
          longitude: startLng!,
          type: MapPinType.pickup,
          title: 'نقطة الانطلاق',
        ),
      if (endLat != null && endLng != null)
        MapPin(
          id: 'end',
          latitude: endLat!,
          longitude: endLng!,
          type: MapPinType.dropoff,
          title: 'الوجهة',
        ),
    ];

    return LiveTripMap(
      pins: pins,
      initialLat: startLat,
      initialLng: startLng,
    );
  }
}
