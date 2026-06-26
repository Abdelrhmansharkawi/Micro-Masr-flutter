import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/app_route_constant.dart';
import 'package:micromasr/core/horizontal_space.dart';
import 'package:micromasr/core/vertical_space.dart';
import 'package:micromasr/features/passenger/data/models/trip_model.dart';
import 'ride_card_header.dart';
import 'station_tag.dart';

class RideCard extends StatelessWidget {
  final TripModel trip;
  const RideCard({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final diff = trip.departureTime.difference(now);
    final minutes = diff.inMinutes.clamp(0, 999);

    return GestureDetector(
      onTap: () => context.push(
        AppRouteConstants.passengerTripDetail,
        extra: trip.id,
      ),
      child: Container(
        padding: EdgeInsets.all(16.aw),
        decoration: BoxDecoration(
          color: context.colors.surface,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            RideCardHeader(
              price: trip.price.toInt(),
              driverName: trip.driverName,
              completedTrips: trip.driverTotalTrips,
              avatarInitial: trip.avatarInitial,
            ),
            const VerticalSpace(16),
            _buildRouteTimeline(context),
            const VerticalSpace(16),
            const Divider(),
            const VerticalSpace(12),
            _buildFooter(context, minutes),
          ],
        ),
      ),
    );
  }

  Widget _buildRouteTimeline(BuildContext context) {
    // Use stops if available, otherwise use start and end names
    final List<String> stops = trip.stops.isNotEmpty
        ? trip.stops
        : [
            trip.startLocation.name ?? 'Start',
            trip.endLocation.name ?? 'End',
          ];

    return Container(
      padding: EdgeInsets.all(12.aw),
      decoration: BoxDecoration(
        color: context.colors.background,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: stops
            .expand((station) => [
                  StationTag(label: station, isSelected: false),
                  if (station != stops.last)
                    Icon(Icons.arrow_back,
                        size: 16, color: context.colors.textSecondary),
                ])
            .toList(),
      ),
    );
  }

  Widget _buildFooter(BuildContext context, int minutes) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildCodePill(context, trip.vehiclePlate ?? 'N/A'),
        Row(
          children: [
            Text(
              '${AppStrings.arrivingIn} $minutes ${AppStrings.minutesSuffix}',
              style: context.bodySmallTextStyle.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
            const HorizontalSpace(12),
            Text(
              '${trip.availableSeats} ${AppStrings.seatsAvailableCount}',
              style: context.bodySmallTextStyle.copyWith(
                color: const Color(0xFF9CCC65),
                fontWeight: FontWeight.bold,
              ),
            ),
            const HorizontalSpace(4),
            const Icon(Icons.star, size: 16, color: Colors.amber),
            Text(
              trip.driverRating.toStringAsFixed(1),
              style: context.labelSmallTextStyle.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCodePill(BuildContext context, String code) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: context.colors.outline.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        code,
        style: context.labelSmallTextStyle.copyWith(
          color: context.colors.onSurface,
        ),
      ),
    );
  }
}
