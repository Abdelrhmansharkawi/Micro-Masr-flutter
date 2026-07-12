import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/app_route_constant.dart';
import 'package:micromasr/core/models/map_pin.dart';
import 'package:micromasr/core/widgets/live_trip_map.dart';
import 'tracking_status_stepper.dart';
import 'tracking_driver_panel.dart';
import 'data/services/tracking_service.dart';
import 'data/services/trip_service.dart';
import 'data/services/booking_service.dart';
import 'data/models/tracking_model.dart';

class TrackingScreen extends StatefulWidget {
  final String tripId;
  const TrackingScreen({super.key, required this.tripId});

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  final TrackingService _trackingService = TrackingService();
  final TripService _tripService = TripService();
  final BookingService _bookingService = BookingService();

  TrackingData? _trackingData;
  bool _isLoading = true;
  bool _isEndingTrip = false;
  String? _error;
  Timer? _pollTimer;

  @override
  void initState() {
    super.initState();
    _fetchTrackingInfo();
    _pollTimer = Timer.periodic(
      const Duration(seconds: 10),
      (_) => _fetchTrackingInfo(silent: true),
    );
  }

  @override
  void dispose() {
    _pollTimer?.cancel();
    super.dispose();
  }

  Future<void> _fetchTrackingInfo({bool silent = false}) async {
    try {
      final data = await _trackingService.getTrackingInfo(widget.tripId);
      if (!mounted) return;
      setState(() {
        _trackingData = data;
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted || silent) return;
      setState(() {
        _error = 'حدث خطأ أثناء تحميل البيانات';
        _isLoading = false;
      });
    }
  }

  List<MapPin> _buildMapPins(TrackingData data) {
    return [
      MapPin(
        id: 'driver',
        latitude: data.driverLocation.latitude,
        longitude: data.driverLocation.longitude,
        type: MapPinType.driver,
        title: data.driver.fullName,
      ),
      if (data.pickupLocation != null)
        MapPin(
          id: 'pickup',
          latitude: data.pickupLocation!.latitude,
          longitude: data.pickupLocation!.longitude,
          type: MapPinType.pickup,
          title: 'نقطة الانطلاق',
        ),
      if (data.dropoffLocation != null)
        MapPin(
          id: 'dropoff',
          latitude: data.dropoffLocation!.latitude,
          longitude: data.dropoffLocation!.longitude,
          type: MapPinType.dropoff,
          title: 'الوجهة',
        ),
    ];
  }

  Future<void> _endTrip() async {
    if (_isEndingTrip) return;

    setState(() {
      _isEndingTrip = true;
    });

    try {
      final trip = await _tripService.getTripById(widget.tripId);
      String bookingId = '';

      try {
        final bookings = await _bookingService.getUserBookings();
        Map<String, dynamic>? booking;
        try {
          booking = bookings.firstWhere(
            (b) =>
                b['trip']?['_id'] == widget.tripId ||
                b['tripId'] == widget.tripId,
          );
        } catch (_) {
          booking = null;
        }
        bookingId = booking?['_id'] ?? booking?['id'] ?? '';
      } catch (_) {}

      if (mounted) {
        context.push(
          '${AppRouteConstants.passengerReview}/${widget.tripId}',
          extra: {
            'driverName': trip.driverName,
            'vehicleInfo': '${trip.vehiclePlate ?? ''} - ${trip.title}',
            'totalPrice': _trackingData?.booking.totalPrice ?? trip.price,
            'bookingId': bookingId,
            'tripDistance':
                '${trip.startLocation.name ?? 'نقطة الانطلاق'} - ${trip.endLocation.name ?? 'الوجهة'}',
            'durationMinutes': trip.estimatedDuration,
          },
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('فشل إنهاء الرحلة: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isEndingTrip = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (_error != null) {
      return Scaffold(body: Center(child: Text('خطأ: $_error')));
    }

    final data = _trackingData!;

    return Scaffold(
      body: Stack(
        children: [
          LiveTripMap(
            pins: _buildMapPins(data),
            showMyLocation: true,
          ),
          SafeArea(
            child: Column(
              children: [
                _buildHeader(context, data),
                const Spacer(),
                TrackingStatusStepper(currentStep: data.currentStep),
                TrackingDriverPanel(
                  trackingData: data,
                  onEndTrip: _endTrip,
                ),
              ],
            ),
          ),
          if (_isEndingTrip)
            Container(
              color: Colors.black.withValues(alpha: 0.3),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, TrackingData data) {
    final remaining = data.remainingMinutes;
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
          )
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => context.go(AppRouteConstants.passengerHome),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: context.colors.outline.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.arrow_forward,
                color: context.colors.primary,
              ),
            ),
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.driverOnWay,
                style: context.labelSmallTextStyle.copyWith(
                  color: context.colors.textSecondary,
                ),
              ),
              RichText(
                text: TextSpan(
                  style: context.titleLargeTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFF09063),
                  ),
                  children: [
                    TextSpan(text: '${AppStrings.arrivesIn} $remaining '),
                    TextSpan(
                      text: AppStrings.minutesLabel,
                      style: context.titleLargeTextStyle.copyWith(
                        color: context.colors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
