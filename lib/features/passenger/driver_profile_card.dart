import 'package:flutter/material.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/horizontal_space.dart';
import 'package:micromasr/core/vertical_space.dart';
import 'package:micromasr/features/passenger/data/models/trip_model.dart';

class DriverProfileCard extends StatelessWidget {
  final TripModel trip;
  const DriverProfileCard({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    final occupiedSeats = trip.totalSeats - trip.availableSeats;
    return Container(
      padding: EdgeInsets.all(20.aw),
      decoration: BoxDecoration(
          color: context.colors.surface,
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 20,
                offset: const Offset(0, 10))
          ]),
      child: Column(
        children: [
          _buildPrimaryInfo(context),
          const VerticalSpace(20),
          _buildActionButtons(context),
          const VerticalSpace(20),
          _buildSeatStatus(context, occupiedSeats),
        ],
      ),
    );
  }

  Widget _buildPrimaryInfo(BuildContext context) {
    return Row(
      children: [
        Container(
            width: 64.aw,
            height: 64.aw,
            decoration: BoxDecoration(
                color: const Color(0xFF9CCC65),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 3)),
            alignment: Alignment.center,
            child: const Icon(Icons.person, color: Colors.white, size: 40)),
        const HorizontalSpace(16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(trip.driverName,
                    style: context.headlineMediumTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.colors.primary)),
                const HorizontalSpace(8),
                _buildPill(
                    context,
                    trip.vehiclePlate ?? '---',
                    context.colors.outline.withValues(alpha: 0.5),
                    context.colors.onSurface),
              ],
            ),
            const VerticalSpace(4),
            Row(
              children: [
                Text('${trip.driverRating.toStringAsFixed(1)}⭐',
                    style: context.bodyMediumTextStyle.copyWith(
                        color: const Color(0xFFF09063),
                        fontWeight: FontWeight.bold)),
                const HorizontalSpace(8),
                Text('${trip.driverTotalTrips} ${AppStrings.completedRides}',
                    style: context.bodySmallTextStyle
                        .copyWith(color: context.colors.textSecondary)),
              ],
            ),
            const VerticalSpace(8),
            _buildPill(context, 'ميكرو باص', context.colors.background,
                context.colors.primary),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Container(width: 4.aw, height: 16.ah, color: context.colors.primary),
        const HorizontalSpace(8),
        Text(AppStrings.contactDriver,
            style: context.bodyLargeTextStyle
                .copyWith(fontWeight: FontWeight.bold)),
        const Spacer(),
        _buildCircleIcon(context, Icons.phone_outlined),
        const HorizontalSpace(12),
        _buildCircleIcon(context, Icons.chat_bubble_outline),
      ],
    );
  }

  Widget _buildSeatStatus(BuildContext context, int occupiedSeats) {
    return Row(
      children: [
        Expanded(
            child: _buildPill(
                context,
                '${trip.availableSeats} ${AppStrings.seatsAvailableCount}',
                const Color(0xFF9CCC65),
                Colors.white,
                padding: 12)),
        const HorizontalSpace(12),
        Expanded(
            child: _buildPill(
                context,
                '$occupiedSeats ${AppStrings.seatsOccupiedCount}',
                context.colors.background,
                context.colors.textSecondary,
                padding: 12)),
      ],
    );
  }

  Widget _buildPill(BuildContext context, String text, Color bg, Color tc,
      {double padding = 8}) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: padding.aw, vertical: 4.ah),
        decoration:
            BoxDecoration(color: bg, borderRadius: BorderRadius.circular(10)),
        child: Text(text,
            style: context.labelSmallTextStyle
                .copyWith(color: tc, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center));
  }

  Widget _buildCircleIcon(BuildContext context, IconData icon) {
    return Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: context.colors.background, shape: BoxShape.circle),
        child: Icon(icon, color: context.colors.textSecondary, size: 24.aw));
  }
}
