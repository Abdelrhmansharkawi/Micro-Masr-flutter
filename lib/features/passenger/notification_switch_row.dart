import 'package:flutter/material.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';

class NotificationSwitchRow extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  const NotificationSwitchRow({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.ah),
      child: Row(
        children: [
          Switch.adaptive(
            value: value,
            onChanged: onChanged,
            activeTrackColor: context.colors.primary.withValues(alpha: 0.5),
            activeThumbColor: context.colors.primary,
          ),
          const Spacer(),
          Text(
            label,
            style: context.bodyLargeTextStyle.copyWith(color: context.colors.primary, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}











