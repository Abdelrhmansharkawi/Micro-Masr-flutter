import 'package:flutter/material.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';

class UploadedRow extends StatelessWidget {
  const UploadedRow({super.key, required this.icon, required this.title, this.subtitle});
  final IconData icon;
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(width: 40.aw, height: 40.aw, decoration: BoxDecoration(color: context.colors.primary.withValues(alpha: 0.12), shape: BoxShape.circle), child: Icon(icon, color: context.colors.primary, size: 22.aw)),
      SizedBox(width: AppSpacing.md.aw),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Text(title, textAlign: TextAlign.right, style: context.titleMediumTextStyle.copyWith(color: context.colors.onSurface, fontWeight: FontWeight.w600)),
        if (subtitle != null) Text(subtitle!, textAlign: TextAlign.right, style: context.bodySmallTextStyle.copyWith(color: context.colors.primary)),
      ])),
      SizedBox(width: AppSpacing.sm.aw),
      Icon(Icons.check_circle_rounded, color: context.colors.primary, size: 24.aw),
    ]);
  }
}

class EmptyColumn extends StatelessWidget {
  const EmptyColumn({super.key, required this.icon, required this.title, this.subtitle});
  final IconData icon;
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(width: 52.aw, height: 52.aw, decoration: BoxDecoration(color: context.colors.outline.withValues(alpha: 0.5), shape: BoxShape.circle), child: Icon(icon, color: context.colors.textSecondary, size: 26.aw)),
      SizedBox(height: AppSpacing.sm.ah),
      Text(title, textAlign: TextAlign.center, style: context.titleMediumTextStyle.copyWith(color: context.colors.onSurface, fontWeight: FontWeight.w600)),
      if (subtitle != null) ...[SizedBox(height: AppSpacing.xs.ah), Text(subtitle!, textAlign: TextAlign.center, style: context.bodySmallTextStyle.copyWith(color: context.colors.textSecondary))],
    ]);
  }
}











