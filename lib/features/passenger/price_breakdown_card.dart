import 'package:flutter/material.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/vertical_space.dart';
import 'payment_selection_preview.dart';
import 'data/models/trip_model.dart';

class PriceBreakdownCard extends StatelessWidget {
  final TripModel trip; // NEW
  final int seatCount;
  const PriceBreakdownCard({
    super.key,
    required this.trip,
    required this.seatCount,
  });

  @override
  Widget build(BuildContext context) {
    final basePrice = seatCount * trip.price.toInt();
    const int serviceFee = 4;
    final totalPrice = basePrice + serviceFee;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PaymentSelectionPreview(),
          const VerticalSpace(20),
          const Divider(),
          const VerticalSpace(20),
          Text(
            AppStrings.paymentDetails,
            style: context.titleMediumTextStyle
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const VerticalSpace(16),
          _buildPriceRow(context, '${AppStrings.seats} ($seatCount)',
              '$basePrice ${AppStrings.egp}'),
          const VerticalSpace(8),
          _buildPriceRow(
              context, AppStrings.serviceFee, '$serviceFee ${AppStrings.egp}'),
          const VerticalSpace(16),
          const Divider(),
          const VerticalSpace(16),
          _buildTotalRow(context, totalPrice),
        ],
      ),
    );
  }

  Widget _buildPriceRow(BuildContext context, String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style: context.bodyMediumTextStyle
                .copyWith(color: context.colors.textSecondary)),
        Text(value, style: context.titleMediumTextStyle),
      ],
    );
  }

  Widget _buildTotalRow(BuildContext context, int total) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppStrings.tripTotal,
          style: context.titleMediumTextStyle
              .copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          '$total ${AppStrings.egp}',
          style: context.headlineLargeTextStyle.copyWith(
            color: const Color(0xFFF09063),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
