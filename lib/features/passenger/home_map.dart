import 'package:flutter/material.dart';
import 'package:micromasr/core/models/map_pin.dart';
import 'package:micromasr/core/widgets/live_trip_map.dart';
import 'data/models/trip_model.dart';

class HomeMap extends StatelessWidget {
  final List<TripModel> trips;
  final double? userLat;
  final double? userLng;

  const HomeMap({
    super.key,
    required this.trips,
    this.userLat,
    this.userLng,
  });

  @override
  Widget build(BuildContext context) {
    final pins = <MapPin>[
      for (final trip in trips)
        MapPin(
          id: 'trip_${trip.id}',
          latitude: trip.startLat,
          longitude: trip.startLng,
          type: MapPinType.trip,
          title: trip.title,
        ),
    ];

    return LiveTripMap(
      pins: pins,
      initialLat: userLat,
      initialLng: userLng,
      showMyLocation: true,
    );
  }
}
