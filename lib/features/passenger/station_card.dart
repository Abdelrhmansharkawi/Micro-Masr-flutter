import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/app_route_constant.dart';
import 'package:micromasr/core/horizontal_space.dart';
import 'data/models/trip_model.dart';

class StationCard extends StatelessWidget {
  final TripModel trip;

  const StationCard({
    super.key,
    required this.trip,
  });

  @override
  Widget build(BuildContext context) {
    final timeString =
        '${trip.departureTime.hour}:${trip.departureTime.minute.toString().padLeft(2, '0')}';
    final destination = trip.endLocation.name ?? 'وجهة غير معروفة';

    return GestureDetector(
      onTap: () =>
          context.push(AppRouteConstants.passengerTripDetail, extra: trip.id),
      child: Container(
        width: 200.aw,
        padding: EdgeInsets.all(12.aw),
        decoration: BoxDecoration(
          color: context.colors.background,
          borderRadius: BorderRadius.circular(20),
          border:
              Border.all(color: context.colors.outline.withValues(alpha: 0.5)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    destination,
                    style: context.titleLargeTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: const Color(0xFF9CCC65),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    '${trip.availableSeats}',
                    style: context.labelSmallTextStyle
                        .copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.access_time,
                        size: 14, color: context.colors.textSecondary),
                    const HorizontalSpace(4),
                    Text(
                      timeString,
                      style: context.bodySmallTextStyle.copyWith(
                        color: context.colors.textSecondary,
                      ),
                    ),
                  ],
                ),
                Text(
                  '${trip.price.toStringAsFixed(0)} ج.م',
                  style: context.bodyMediumTextStyle.copyWith(
                    color: const Color(0xFFF09063),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
