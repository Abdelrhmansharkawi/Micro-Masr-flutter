import 'package:flutter/material.dart';
import 'package:micromasr/core/app_radius.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';

enum BadgeStatus { confirmed, pending, cancelled, completed }

class StatusBadge extends StatelessWidget {
  const StatusBadge({
    super.key,
    required this.label,
    required this.status,
  });

  final String label;
  final BadgeStatus status;

  @override
  Widget build(BuildContext context) {
    final (Color bg, Color text) = switch (status) {
      BadgeStatus.confirmed => (context.colors.primaryContainer, context.colors.primary),
      BadgeStatus.pending => (context.colors.warning.withValues(alpha: 0.2), context.colors.warning),
      BadgeStatus.cancelled => (context.colors.error.withValues(alpha: 0.2), context.colors.error),
      BadgeStatus.completed => (context.colors.success.withValues(alpha: 0.2), context.colors.success),
    };

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.sm.aw,
        vertical: AppSpacing.xs.ah,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: AppRadius.pillAll,
      ),
      child: Text(
        label,
        style: context.labelSmallTextStyle.copyWith(color: text),
      ),
    );
  }
}











