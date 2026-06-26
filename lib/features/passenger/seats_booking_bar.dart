import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/app_route_constant.dart';
import 'package:micromasr/core/app_button.dart';
import 'package:micromasr/core/vertical_space.dart';
import 'data/models/trip_model.dart';

class SeatsBookingBar extends StatelessWidget {
  final int selectedSeatsCount;
  final TripModel trip;
  final List<int> selectedSeats;

  const SeatsBookingBar({
    super.key,
    required this.selectedSeatsCount,
    required this.trip,
    required this.selectedSeats,
  });

  @override
  Widget build(BuildContext context) {
    final totalPrice = selectedSeatsCount * trip.price.toInt();

    return Container(
      padding: EdgeInsets.fromLTRB(24.aw, 16.ah, 24.aw, 32.ah),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, -5),
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildPriceInfo(context, totalPrice),
              _buildSeatsInfo(context, selectedSeatsCount),
            ],
          ),
          const VerticalSpace(16),
          AppButton(
            label: AppStrings.confirmSeats,
            isDisabled: selectedSeatsCount == 0,
            onPressed: () =>
                context.push(AppRouteConstants.passengerBookingConfirm,
              extra: {
                'trip': trip,
                'selectedSeats': selectedSeats,
              },),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceInfo(BuildContext context, int price) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.tripTotal,
            style: context.bodySmallTextStyle
                .copyWith(color: context.colors.textSecondary)),
        Text('$price ${AppStrings.egp}',
            style: context.headlineLargeTextStyle.copyWith(
                color: const Color(0xFFF09063), fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildSeatsInfo(BuildContext context, int count) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.selectedSeatsCountLabel,
            style: context.bodySmallTextStyle
                .copyWith(color: context.colors.textSecondary)),
        Text('$count ${AppStrings.seats}',
            style: context.titleLargeTextStyle.copyWith(
                color: const Color(0xFF9CCC65), fontWeight: FontWeight.bold)),
      ],
    );
  }
}
