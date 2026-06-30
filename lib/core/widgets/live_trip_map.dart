import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:micromasr/core/maps_config.dart';
import 'package:micromasr/core/models/map_pin.dart';

/// Shared Google Map widget for passenger & driver live tracking (Uber-style).
class LiveTripMap extends StatefulWidget {
  const LiveTripMap({
    super.key,
    this.pins = const [],
    this.initialLat,
    this.initialLng,
    this.showMyLocation = false,
    this.onMapCreated,
  });

  final List<MapPin> pins;
  final double? initialLat;
  final double? initialLng;
  final bool showMyLocation;
  final void Function(GoogleMapController controller)? onMapCreated;

  @override
  State<LiveTripMap> createState() => _LiveTripMapState();
}

class _LiveTripMapState extends State<LiveTripMap> {
  GoogleMapController? _controller;

  LatLng get _initialTarget {
    if (widget.initialLat != null && widget.initialLng != null) {
      return LatLng(widget.initialLat!, widget.initialLng!);
    }
    if (widget.pins.isNotEmpty) {
      return widget.pins.first.latLng;
    }
    return const LatLng(MapsConfig.defaultLat, MapsConfig.defaultLng);
  }

  Set<Marker> get _markers => widget.pins.map((pin) => pin.toMarker()).toSet();

  @override
  void didUpdateWidget(covariant LiveTripMap oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.pins != widget.pins) {
      _fitBounds();
    }
  }

  Future<void> _fitBounds() async {
    final controller = _controller;
    if (controller == null || widget.pins.length < 2) return;

    double minLat = widget.pins.first.latitude;
    double maxLat = widget.pins.first.latitude;
    double minLng = widget.pins.first.longitude;
    double maxLng = widget.pins.first.longitude;

    for (final pin in widget.pins) {
      minLat = minLat < pin.latitude ? minLat : pin.latitude;
      maxLat = maxLat > pin.latitude ? maxLat : pin.latitude;
      minLng = minLng < pin.longitude ? minLng : pin.longitude;
      maxLng = maxLng > pin.longitude ? maxLng : pin.longitude;
    }

    await controller.animateCamera(
      CameraUpdate.newLatLngBounds(
        LatLngBounds(
          southwest: LatLng(minLat, minLng),
          northeast: LatLng(maxLat, maxLng),
        ),
        80,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!MapsConfig.isConfigured) {
      return _MapFallback(pins: widget.pins);
    }

    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: _initialTarget,
        zoom: 14,
      ),
      markers: _markers,
      myLocationEnabled: widget.showMyLocation,
      myLocationButtonEnabled: widget.showMyLocation,
      zoomControlsEnabled: false,
      mapToolbarEnabled: false,
      compassEnabled: false,
      onMapCreated: (controller) {
        _controller = controller;
        widget.onMapCreated?.call(controller);
        _fitBounds();
      },
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}

class _MapFallback extends StatelessWidget {
  const _MapFallback({required this.pins});

  final List<MapPin> pins;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFE8F5E9), Color(0xFFDCEDC8)],
        ),
      ),
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.map_outlined,
                    size: 64,
                    color: Colors.green.shade700.withValues(alpha: 0.4),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'الخريطة جاهزة',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade800.withValues(alpha: 0.6),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'add google maps key',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.green.shade900.withValues(alpha: 0.5),
                    ),
                  ),
                ],
              ),
            ),
          ),
          for (var i = 0; i < pins.length && i < 5; i++)
            Positioned(
              top: 120 + (i * 40.0),
              left: 80 + (i * 30.0),
              child: Icon(
                _iconFor(pins[i].type),
                color: _colorFor(pins[i].type),
                size: 32,
              ),
            ),
        ],
      ),
    );
  }

  IconData _iconFor(MapPinType type) {
    switch (type) {
      case MapPinType.driver:
        return Icons.navigation;
      case MapPinType.pickup:
        return Icons.trip_origin;
      case MapPinType.dropoff:
        return Icons.location_on;
      case MapPinType.trip:
        return Icons.directions_bus;
      case MapPinType.user:
        return Icons.person_pin_circle;
    }
  }

  Color _colorFor(MapPinType type) {
    switch (type) {
      case MapPinType.driver:
        return const Color(0xFFE28B5A);
      case MapPinType.pickup:
        return const Color(0xFF558B2F);
      case MapPinType.dropoff:
        return Colors.red.shade700;
      case MapPinType.trip:
        return const Color(0xFF558B2F);
      case MapPinType.user:
        return const Color(0xFFF09063);
    }
  }
}
