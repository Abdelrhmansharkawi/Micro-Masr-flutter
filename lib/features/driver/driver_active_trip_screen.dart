import 'package:flutter/material.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/maps_config.dart';
import 'package:micromasr/core/models/map_pin.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/widgets/live_trip_map.dart';
import 'package:micromasr/features/driver/active_trip_bottom_sheet.dart';
import 'package:micromasr/features/driver/active_trip_navigation_card.dart';
import 'package:micromasr/features/driver/active_trip_stepper.dart';

class DriverActiveTripScreen extends StatelessWidget {
  const DriverActiveTripScreen({super.key});

  static const _demoPins = [
    MapPin(
      id: 'driver',
      latitude: MapsConfig.defaultLat + 0.01,
      longitude: MapsConfig.defaultLng + 0.01,
      type: MapPinType.driver,
      title: 'موقعك',
    ),
    MapPin(
      id: 'pickup',
      latitude: MapsConfig.defaultLat + 0.005,
      longitude: MapsConfig.defaultLng + 0.005,
      type: MapPinType.pickup,
      title: 'نقطة استلام الراكب',
    ),
    MapPin(
      id: 'dropoff',
      latitude: MapsConfig.defaultLat - 0.008,
      longitude: MapsConfig.defaultLng - 0.006,
      type: MapPinType.dropoff,
      title: 'الوجهة',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    const darkGreen = Color(0xFF4A7450);
    const orangeColor = Color(0xFFE28B5A);

    return Scaffold(
      backgroundColor: const Color(0xFFF2EFE8),
      body: Stack(
        children: [
          const LiveTripMap(
            pins: _demoPins,
            showMyLocation: true,
          ),
          _TopOverlay(darkGreen: darkGreen),
          const Align(
            alignment: Alignment.bottomCenter,
            child: ActiveTripBottomSheet(
              darkGreen: darkGreen,
              orangeColor: orangeColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _TopOverlay extends StatelessWidget {
  final Color darkGreen;
  const _TopOverlay({required this.darkGreen});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 16.ah,
      left: AppSpacing.lg.aw,
      right: AppSpacing.lg.aw,
      child: Column(
        children: [
          ActiveTripNavigationCard(darkGreen: darkGreen),
          SizedBox(height: 12.ah),
          ActiveTripStepper(darkGreen: darkGreen),
        ],
      ),
    );
  }
}
