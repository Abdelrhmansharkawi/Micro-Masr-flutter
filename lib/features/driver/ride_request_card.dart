import 'package:flutter/material.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/features/driver/ride_request_actions.dart';
import 'package:micromasr/features/driver/ride_request_components.dart';

class RideRequestCard extends StatelessWidget {
  final Color darkGreen, orangeColor;
  const RideRequestCard({
    super.key,
    required this.darkGreen,
    required this.orangeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppSpacing.lg.aw),
      padding: EdgeInsets.all(AppSpacing.lg.aw),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        children: [
          PassengerInfoRow(orangeColor: orangeColor, darkGreen: darkGreen),
          SizedBox(height: AppSpacing.md.ah),
          Divider(color: Colors.grey[200]),
          SizedBox(height: AppSpacing.md.ah),
          LocationInfoRow(darkGreen: darkGreen, orangeColor: orangeColor),
          SizedBox(height: AppSpacing.lg.ah),
          const RideDetailsChips(),
          SizedBox(height: AppSpacing.lg.ah),
          RideMapThumbnail(orangeColor: orangeColor),
          SizedBox(height: AppSpacing.lg.ah),
          EarningsBox(orangeColor: orangeColor),
          SizedBox(height: AppSpacing.lg.ah),
          AcceptButton(darkGreen: darkGreen),
        ],
      ),
    );
  }
}











