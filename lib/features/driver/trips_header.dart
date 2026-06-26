import 'package:flutter/material.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';

class TripsHeader extends StatelessWidget {
  final Color darkGreen;
  const TripsHeader({super.key, required this.darkGreen});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.md.aw, vertical: AppSpacing.sm.ah),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.calendar_month_outlined, color: darkGreen),
          Text(
            'سجل الرحلات',
            style: context.titleLargeTextStyle.copyWith(color: darkGreen, fontWeight: FontWeight.bold),
          ),
          Icon(Icons.arrow_forward_ios_rounded, color: darkGreen, size: 20.aw),
        ],
      ),
    );
  }
}











