import 'package:flutter/material.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/vertical_space.dart';

class ReviewHeader extends StatelessWidget {
  final String tripDistance;
  final int durationMinutes;
  final int price;

  const ReviewHeader({
    super.key,
    required this.tripDistance,
    required this.durationMinutes,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40),
      decoration: const BoxDecoration(
        color: Color(0xFF558B2F),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check,
                color: Color(0xFF558B2F),
                size: 32,
              ),
            ),
            const VerticalSpace(16),
            Text(
              AppStrings.arrivedSafely,
              style: context.headlineLargeTextStyle.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              AppStrings.thanksForUsing,
              style: context.bodyMediumTextStyle.copyWith(
                color: Colors.white.withValues(alpha: 0.8),
              ),
            ),
            const VerticalSpace(24),
            _buildTripStats(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTripStats(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStat(context, '$price', AppStrings.egp),
          Container(
            width: 1,
            height: 20,
            color: Colors.grey.shade300,
          ),
          _buildStat(context, tripDistance, ''),
          Container(
            width: 1,
            height: 20,
            color: Colors.grey.shade300,
          ),
          _buildStat(context, '$durationMinutes', AppStrings.minutesLabel),
        ],
      ),
    );
  }

  Widget _buildStat(BuildContext context, String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: context.titleMediumTextStyle.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        if (label.isNotEmpty)
          Text(
            label,
            style: context.labelSmallTextStyle.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
      ],
    );
  }
}
