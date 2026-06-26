import 'package:flutter/material.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';

class ActiveTripNavigationCard extends StatelessWidget {
  final Color darkGreen;
  const ActiveTripNavigationCard({super.key, required this.darkGreen});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.aw, vertical: AppSpacing.md.ah),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.95),
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('انعطف يساراً بعد ٢٠٠ متر', style: context.titleMediumTextStyle.copyWith(color: darkGreen, fontWeight: FontWeight.bold)),
              Text('شارع الجامعة الرئيسي', style: context.bodyMediumTextStyle.copyWith(color: context.colors.textSecondary)),
            ],
          ),
          SizedBox(width: 16.aw),
          Container(
            padding: EdgeInsets.all(12.aw),
            decoration: const BoxDecoration(color: Color(0xFFF2EFE8), shape: BoxShape.circle),
            child: Icon(Icons.turn_left, color: darkGreen, size: 24.aw),
          ),
        ],
      ),
    );
  }
}











