import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/app_route_constant.dart';
import 'package:micromasr/core/app_button.dart';
import 'package:micromasr/core/horizontal_space.dart';
import 'package:micromasr/features/passenger/data/models/trip_model.dart';

class TripBookingBar extends StatelessWidget {
  final TripModel trip;
  const TripBookingBar({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    final totalPrice = trip.price;
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.fromLTRB(24.aw, 16.ah, 24.aw, 32.ah),
        decoration: BoxDecoration(
          color: context.colors.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 20,
                offset: const Offset(0, -5))
          ],
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('${totalPrice.toStringAsFixed(0)} ${AppStrings.egp}',
                    style: context.headlineLargeTextStyle.copyWith(
                        color: const Color(0xFFF09063),
                        fontWeight: FontWeight.bold)),
                Text(AppStrings.tripTotal,
                    style: context.bodySmallTextStyle
                        .copyWith(color: context.colors.textSecondary)),
              ],
            ),
            const HorizontalSpace(32),
            Expanded(
              child: AppButton(
                label: AppStrings.bookNowLarge,
                onPressed: () =>
                    context.push(AppRouteConstants.passengerSeats, extra: trip),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
