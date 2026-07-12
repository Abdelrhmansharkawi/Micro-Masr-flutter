import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as ll;
import 'package:micromasr/core/maps_config.dart';
import 'package:micromasr/core/models/map_pin.dart';

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
  final void Function(MapController controller)? onMapCreated;

  @override
  State<LiveTripMap> createState() => _LiveTripMapState();
}

class _LiveTripMapState extends State<LiveTripMap> {
  final MapController _mapController = MapController();

  ll.LatLng get _initialTarget {
    if (widget.initialLat != null && widget.initialLng != null) {
      return ll.LatLng(widget.initialLat!, widget.initialLng!);
    }
    if (widget.pins.isNotEmpty) {
      return ll.LatLng(widget.pins.first.latitude, widget.pins.first.longitude);
    }
    return const ll.LatLng(MapsConfig.defaultLat, MapsConfig.defaultLng);
  }

  @override
  void didUpdateWidget(covariant LiveTripMap oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.pins != widget.pins && widget.pins.isNotEmpty) {
      _fitBounds();
    }
  }

  void _fitBounds() {
    if (widget.pins.length < 2) return;

    final points =
        widget.pins.map((p) => ll.LatLng(p.latitude, p.longitude)).toList();
    final bounds = LatLngBounds.fromPoints(points);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      try {
        _mapController.fitCamera(
          CameraFit.bounds(
            bounds: bounds,
            padding: const EdgeInsets.all(80.0),
          ),
        );
      } catch (e) {
        debugPrint("Map bounds error: $e");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final mapMarkers = widget.pins.map((pin) {
      return Marker(
        point: ll.LatLng(pin.latitude, pin.longitude),
        width: 40,
        height: 40,
        child: GestureDetector(
          onTap: () {
            if (pin.title != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(pin.title!)),
              );
            }
          },
          child: Icon(
            _iconFor(pin.type),
            color: _colorFor(pin.type),
            size: 32,
          ),
        ),
      );
    }).toList();

    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        initialCenter: _initialTarget,
        initialZoom: 14.0,
        onMapReady: () {
          widget.onMapCreated?.call(_mapController);
          _fitBounds();
        },
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.micromasr',
        ),
        MarkerLayer(markers: mapMarkers),
      ],
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
