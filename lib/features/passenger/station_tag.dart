import 'package:flutter/material.dart';
import 'package:micromasr/core/context_extensions.dart';

class StationTag extends StatelessWidget {
  const StationTag({
    super.key,
    required this.label,
    required this.isSelected,
  });

  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        color: isSelected ? context.colors.primary : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: context.colors.primary.withValues(alpha: 0.3)),
      ),
      child: Text(label, style: context.bodySmallTextStyle.copyWith(color: isSelected ? Colors.white : context.colors.primary)),
    );
  }
}











