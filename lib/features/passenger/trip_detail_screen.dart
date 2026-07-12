import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/vertical_space.dart';
import 'trip_detail_header.dart';
import 'trip_detail_map.dart';
import 'driver_profile_card.dart';
import 'trip_timeline.dart';
import 'trip_booking_bar.dart';
import 'package:micromasr/features/passenger/data/models/trip_model.dart';
import 'package:micromasr/features/passenger/data/services/trip_service.dart';

class TripDetailScreen extends StatelessWidget {
  TripDetailScreen({super.key});

  final TripService _tripService = TripService();

  @override
  Widget build(BuildContext context) {
    final tripId = GoRouterState.of(context).extra as String?; 
    if (tripId == null) {
      return Scaffold(
        body: Center(child: Text('No trip ID provided')),
      );
    }
    return Scaffold(
      backgroundColor: context.colors.background,
      body: FutureBuilder<TripModel>(
        future: _tripService.getTripById(tripId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return const Center(child: Text('Trip not found'));
          }

          final trip = snapshot.data!;
          return Stack(
            children: [
              TripDetailMap(
                startLat: trip.startLat,
                startLng: trip.startLng,
                endLat: trip.endLocation.latitude,
                endLng: trip.endLocation.longitude,
              ),
              SafeArea(
                child: Column(
                  children: [
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TripDetailHeader()),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          DriverProfileCard(trip: trip), 
                          const VerticalSpace(16),
                          TripTimeline(trip: trip), 
                          const VerticalSpace(100),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              TripBookingBar(trip: trip), 
            ],
          );
        },
      ),
    );
  }
}
