import 'package:flutter/material.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/horizontal_space.dart';

class SeatsLegend extends StatelessWidget {
  const SeatsLegend({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.aw),
      padding: EdgeInsets.symmetric(vertical: 12.ah, horizontal: 16.aw),
      decoration: BoxDecoration(color: context.colors.surface, borderRadius: BorderRadius.circular(100), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 5))]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildLegendItem(context, AppStrings.seatSelected, const Color(0xFFF09063), Icons.check),
          _buildLegendItem(context, AppStrings.seatOccupied, context.colors.outline, Icons.person),
          _buildLegendItem(context, AppStrings.seatAvailable, const Color(0xFF9CCC65), null),
        ],
      ),
    );
  }

  Widget _buildLegendItem(BuildContext context, String label, Color color, IconData? icon) {
    return Row(
      children: [
        Text(label, style: context.bodySmallTextStyle.copyWith(fontWeight: FontWeight.bold)),
        const HorizontalSpace(8),
        Container(
          width: 24.aw,
          height: 24.aw,
          decoration: BoxDecoration(color: icon == null ? Colors.white : color, shape: BoxShape.circle, border: Border.all(color: color, width: 2)),
          child: icon != null ? Icon(icon, size: 14, color: Colors.white) : null,
        ),
      ],
    );
  }
}











