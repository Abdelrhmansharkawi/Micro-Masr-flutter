import 'package:flutter/material.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/app_strings.dart';

class TripsStatsRow extends StatelessWidget {
  final Color darkGreen;
  const TripsStatsRow({super.key, required this.darkGreen});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.md.aw),
      child: Row(
        children: [
          Expanded(child: _StatCard(title: AppStrings.myRating, value: '4.9 ⭐️', valueColor: darkGreen)),
          SizedBox(width: AppSpacing.sm.aw),
          Expanded(child: _StatCard(title: 'الأرباح', value: '1280 ج', valueColor: const Color(0xFFE28B5A))),
          SizedBox(width: AppSpacing.sm.aw),
          Expanded(child: _StatCard(title: 'هذا الشهر', value: '84 رحلة', valueColor: darkGreen)),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title, value;
  final Color valueColor;
  const _StatCard({required this.title, required this.value, required this.valueColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: AppSpacing.sm.ah),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 6, offset: const Offset(0, 2))]),
      child: Column(children: [
        Text(title, style: context.bodySmallTextStyle.copyWith(color: const Color(0xFF4A7450), fontWeight: FontWeight.w600)),
        SizedBox(height: 4.ah),
        Text(value, style: context.titleMediumTextStyle.copyWith(color: valueColor, fontWeight: FontWeight.bold)),
      ]),
    );
  }
}
