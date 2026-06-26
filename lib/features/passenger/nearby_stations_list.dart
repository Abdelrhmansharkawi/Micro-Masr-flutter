import 'package:flutter/material.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/horizontal_space.dart';
import 'station_card.dart';
import 'data/models/trip_model.dart';

class NearbyStationsList extends StatelessWidget {
  final List<TripModel> trips;

  const NearbyStationsList({super.key, required this.trips});

  @override
  Widget build(BuildContext context) {
    if (trips.isEmpty) {
      return const Center(
        child: Text('لا توجد رحلات قريبة'),
      );
    }

    return SizedBox(
      height: 140.ah,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemBuilder: (context, index) {
          final trip = trips[index];
          return StationCard(
            trip: trip,
          );
        },
        separatorBuilder: (context, index) => const HorizontalSpace(16),
        itemCount: trips.length,
      ),
    );
  }
}
