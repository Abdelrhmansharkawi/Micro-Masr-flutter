import 'package:flutter/material.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';

class FaqItem extends StatelessWidget {
  final int index, expandedIndex;
  final String title, content;
  final Color darkGreen;
  final Function(int) onTap;

  const FaqItem({super.key, required this.index, required this.expandedIndex, required this.title, required this.content, required this.darkGreen, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final isExp = expandedIndex == index;
    return GestureDetector(
      onTap: () => onTap(isExp ? -1 : index),
      child: Container(
        padding: EdgeInsets.all(AppSpacing.lg.aw),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), border: isExp ? const Border(right: BorderSide(color: Colors.lightGreen, width: 4)) : null, boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 10, offset: const Offset(0, 4))]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Icon(isExp ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, color: darkGreen), Expanded(child: Text(title, textAlign: TextAlign.right, style: context.bodyLargeTextStyle.copyWith(color: isExp ? Colors.lightGreen : darkGreen, fontWeight: FontWeight.bold)))]),
          if (isExp) ...[SizedBox(height: AppSpacing.md.ah), Text(content, textAlign: TextAlign.right, style: context.bodyMediumTextStyle.copyWith(color: context.colors.textSecondary, height: 1.5))],
        ]),
      ),
    );
  }
}











