import 'package:flutter/material.dart';
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;
        const minLat = 30.0, maxLat = 30.2; // example for Cairo
        const minLng = 31.0, maxLng = 31.4;

        Offset latLngToScreen(double lat, double lng) {
          final x = width * (lng - minLng) / (maxLng - minLng);
          final y =
              height * (1 - (lat - minLat) / (maxLat - minLat)); 
          return Offset(x, y);
        }

        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              center: Alignment(0, -0.2),
              radius: 1.5,
              colors: [
                Color(0xFFE8F5E9),
                Color(0xFFF1F8E9),
                Color(0xFFDCEDC8),
              ],
            ),
          ),
          child: Stack(
            children: [
              for (final trip in trips)
                _buildMapMarker(
                    context, latLngToScreen(trip.startLat, trip.startLng)),
              if (userLat != null && userLng != null)
                _buildUserLocationMarker(
                    context, latLngToScreen(userLat!, userLng!)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMapMarker(BuildContext context, Offset position) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
                color: Color(0xFF558B2F), shape: BoxShape.circle),
            child:
                const Icon(Icons.directions_bus, color: Colors.white, size: 16),
          ),
          Container(
              width: 4,
              height: 4,
              decoration: const BoxDecoration(
                  color: Color(0xFF558B2F), shape: BoxShape.circle)),
        ],
      ),
    );
  }

  Widget _buildUserLocationMarker(BuildContext context, Offset position) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFF09063).withValues(alpha: 0.2),
          shape: BoxShape.circle,
        ),
        child: Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: const Color(0xFFF09063),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 3),
          ),
        ),
      ),
    );
  }
}
