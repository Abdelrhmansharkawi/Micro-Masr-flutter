import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/app_route_constant.dart';
import 'package:micromasr/core/horizontal_space.dart';
import 'package:micromasr/core/vertical_space.dart';
import 'package:micromasr/features/passenger/data/models/trip_model.dart';

class NearbyStationsSheet extends StatelessWidget {
  final List<TripModel> trips;

  const NearbyStationsSheet({
    super.key,
    required this.trips,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.35,
      minChildSize: 0.3,
      maxChildSize: 0.6,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: context.colors.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 20,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: Stack(
            children: [
              _buildContent(context, scrollController),
              _buildBookFAB(context),
            ],
          ),
        );
      },
    );
  }

  Widget _buildContent(
      BuildContext context, ScrollController scrollController) {
    return ListView(
      controller: scrollController,
      padding: EdgeInsets.symmetric(horizontal: 24.aw, vertical: 16.ah),
      children: [
        Center(
          child: Container(
            width: 50.aw,
            height: 5.ah,
            decoration: BoxDecoration(
              color: context.colors.outline,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const VerticalSpace(16),
        _buildHeader(context),
        const VerticalSpace(20),
        if (trips.isEmpty)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.ah),
            child: Text(
              'لا توجد رحلات قريبة',
              style: context.bodyMediumTextStyle,
              textAlign: TextAlign.center,
            ),
          )
        else
          ...trips.map((trip) => _buildTripCard(context, trip)),
        SizedBox(height: 80.ah),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Container(width: 4.aw, height: 20.ah, color: context.colors.primary),
        const HorizontalSpace(8),
        Text(
          AppStrings.nearbyStations,
          style: context.headlineMediumTextStyle.copyWith(
            color: context.colors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () => context.push(AppRouteConstants.passengerSearch),
          child: Text(
            AppStrings.viewAll,
            style: context.bodyMediumTextStyle.copyWith(
              color: const Color(0xFF9CCC65),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTripCard(BuildContext context, TripModel trip) {
    final hour = trip.departureTime.hour;
    final minute = trip.departureTime.minute;
    final timeString = '$hour:${minute.toString().padLeft(2, '0')}';

    return Container(
      margin: EdgeInsets.only(bottom: 12.ah),
      padding: EdgeInsets.all(12.aw),
      decoration: BoxDecoration(
        color: context.colors.background,
        borderRadius: BorderRadius.circular(16),
        border:
            Border.all(color: context.colors.outline.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF558B2F).withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.directions_bus, color: Color(0xFF558B2F)),
          ),
          const HorizontalSpace(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  trip.title,
                  style: context.bodyMediumTextStyle
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4.ah),
                Row(
                  children: [
                    Icon(Icons.location_on,
                        size: 14.aw, color: context.colors.textSecondary),
                    SizedBox(width: 4.aw),
                    Text(
                      trip.startLocation.name ?? 'بداية الرحلة',
                      style: context.bodySmallTextStyle
                          .copyWith(color: context.colors.textSecondary),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                timeString,
                style: context.bodyMediumTextStyle
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4.ah),
              Text(
                '${trip.availableSeats} مقعد',
                style: context.labelSmallTextStyle
                    .copyWith(color: context.colors.primary),
              ),
            ],
          ),
          const HorizontalSpace(8),
          Text(
            '${trip.price.toStringAsFixed(0)} ج.م',
            style: context.bodyMediumTextStyle.copyWith(
              color: const Color(0xFFF09063),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBookFAB(BuildContext context) {
    return Positioned.directional(
      textDirection: TextDirection.rtl,
      bottom: 24.ah,
      start: 24.aw,
      child: GestureDetector(
        onTap: () => context.push(AppRouteConstants.passengerRides),
        child: Container(
          padding: EdgeInsets.all(16.aw),
          decoration: const BoxDecoration(
            color: Color(0xFFF09063),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Color(0x40F09063),
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            children: [
              const Icon(Icons.directions_bus, color: Colors.white),
              Text(
                AppStrings.bookNow,
                style: context.labelSmallTextStyle.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
