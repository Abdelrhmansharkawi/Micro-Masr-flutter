import 'package:flutter/material.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/horizontal_space.dart';

class RideCardHeader extends StatelessWidget {
  const RideCardHeader({
    super.key,
    required this.price,
    required this.driverName,
    required this.completedTrips,
    required this.avatarInitial,
  });

  final int price;
  final String driverName;
  final int completedTrips;
  final String avatarInitial;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 48.aw,
              height: 48.aw,
              decoration: const BoxDecoration(color: Color(0xFF9CCC65), shape: BoxShape.circle),
              alignment: Alignment.center,
              child: Text(avatarInitial, style: context.headlineMediumTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            const HorizontalSpace(12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(driverName, style: context.titleMediumTextStyle.copyWith(fontWeight: FontWeight.bold)),
                Text('$completedTrips ${AppStrings.completedRides}', style: context.bodySmallTextStyle.copyWith(color: context.colors.textSecondary)),
              ],
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.aw, vertical: 8.ah),
          decoration: BoxDecoration(
            color: const Color(0xFFF09063).withValues(alpha: 0.8),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text('$price ${AppStrings.egp}', style: context.titleMediumTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}











