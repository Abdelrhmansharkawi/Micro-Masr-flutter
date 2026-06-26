import 'package:flutter/material.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/features/driver/driver_shared_widgets.dart';

class HomeStatsRow extends StatelessWidget {
  final Color darkGreen;
  final dynamic stats;
  const HomeStatsRow({super.key, required this.darkGreen, required this.stats});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: DriverCircularStat(title: AppStrings.myRating, value: stats.rating.toString(), icon: Icons.star, iconColor: Colors.lightGreen, valueColor: darkGreen)),
        SizedBox(width: AppSpacing.sm.aw),
        Expanded(child: DriverCircularStat(title: AppStrings.tripsCount, value: stats.tripsCount.toString(), icon: Icons.route_outlined, iconColor: darkGreen, valueColor: darkGreen)),
        SizedBox(width: AppSpacing.sm.aw),
        Expanded(child: DriverCircularStat(title: AppStrings.todayEarnings, value: '${stats.todayEarnings.toInt()}ج', icon: Icons.account_balance_wallet_outlined, iconColor: darkGreen, valueColor: const Color(0xFFE28B5A))),
      ],
    );
  }
}











