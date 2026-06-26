import 'package:flutter/material.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';

class SupportSearchHeader extends StatelessWidget {
  final Color darkGreen;
  const SupportSearchHeader({super.key, required this.darkGreen});
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const SizedBox(width: 24),
        Text('الدعم والمساعدة للسائقين', style: context.titleLargeTextStyle.copyWith(color: darkGreen, fontWeight: FontWeight.w800)),
        GestureDetector(onTap: () => Navigator.pop(context), child: Container(padding: EdgeInsets.all(8.aw), decoration: BoxDecoration(color: darkGreen.withValues(alpha: 0.05), shape: BoxShape.circle), child: Icon(Icons.arrow_forward_rounded, color: darkGreen))),
      ]),
      SizedBox(height: AppSpacing.xl.ah),
      Text('كيف يمكننا مساعدتك اليوم؟', textAlign: TextAlign.right, style: context.titleMediumTextStyle.copyWith(color: darkGreen, fontWeight: FontWeight.bold)),
      SizedBox(height: AppSpacing.sm.ah),
      Container(
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 8, offset: const Offset(0, 2))]),
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.aw, vertical: 4.ah),
        child: Row(children: [Icon(Icons.search, color: darkGreen), Expanded(child: TextField(textAlign: TextAlign.right, decoration: InputDecoration(border: InputBorder.none, hintText: 'ابحث عن سؤالك...', hintStyle: context.bodyMediumTextStyle.copyWith(color: context.colors.textSecondary))))]),
      ),
    ]);
  }
}

class SupportFilterChips extends StatelessWidget {
  const SupportFilterChips({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      _Chip(label: 'المستندات', isActive: false),
      SizedBox(width: 8.aw),
      _Chip(label: 'الحجز والرحلات', isActive: false),
      SizedBox(width: 8.aw),
      _Chip(label: 'الأرباح', isActive: true),
    ]);
  }
}

class _Chip extends StatelessWidget {
  final String label;
  final bool isActive;
  const _Chip({required this.label, required this.isActive});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.aw, vertical: 8.ah),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), border: isActive ? Border.all(color: Colors.lightGreen) : null, boxShadow: isActive ? null : [BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 4, offset: const Offset(0, 2))]),
      child: Text(label, style: context.bodyMediumTextStyle.copyWith(color: isActive ? const Color(0xFF4A7450) : context.colors.textSecondary, fontWeight: isActive ? FontWeight.bold : FontWeight.normal)),
    );
  }
}











