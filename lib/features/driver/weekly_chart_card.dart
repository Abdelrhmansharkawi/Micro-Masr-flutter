import 'package:flutter/material.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/features/driver/driver_shared_widgets.dart';

class WeeklyChartCard extends StatelessWidget {
  final Color darkGreen;
  const WeeklyChartCard({super.key, required this.darkGreen});

  @override
  Widget build(BuildContext context) {
    return DriverCard(
      padding: EdgeInsets.all(AppSpacing.md.aw),
      child: Column(
        children: [
          const DriverSectionHeader(title: 'أرباح الأسبوع'),
          SizedBox(height: AppSpacing.xxl.ah),
          SizedBox(
            height: 120.ah,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _ChartBar(day: 'س', percent: 0.3, darkGreen: darkGreen),
                _ChartBar(day: 'ح', percent: 0.5, darkGreen: darkGreen),
                _ChartBar(day: 'ن', percent: 0.7, darkGreen: darkGreen),
                _ChartBar(day: 'ث', percent: 0.4, darkGreen: darkGreen),
                _ChartBar(day: 'ر', percent: 0.6, darkGreen: darkGreen),
                _ChartBar(day: 'خ', percent: 0.8, darkGreen: darkGreen),
                _ChartBar(day: 'ج', percent: 0.2, darkGreen: darkGreen),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ChartBar extends StatelessWidget {
  final String day;
  final double percent;
  final Color darkGreen;
  const _ChartBar({required this.day, required this.percent, required this.darkGreen});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(width: 12.aw, height: percent * 80.ah, decoration: BoxDecoration(color: Colors.lightGreen.withValues(alpha: 0.3), borderRadius: BorderRadius.circular(6))),
        SizedBox(height: 8.ah),
        Text(day, style: context.bodySmallTextStyle.copyWith(color: darkGreen, fontWeight: FontWeight.w600)),
      ],
    );
  }
}











