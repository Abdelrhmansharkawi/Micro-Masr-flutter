import 'package:flutter/material.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';

class CurrentPayoutCard extends StatelessWidget {
  final Color darkGreen;
  const CurrentPayoutCard({super.key, required this.darkGreen});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.lg.aw),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 10, offset: const Offset(0, 4))], border: const Border(right: BorderSide(color: Colors.lightGreen, width: 4))),
      child: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(padding: EdgeInsets.symmetric(horizontal: 12.aw, vertical: 4.ah), decoration: BoxDecoration(color: Colors.lightGreen.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(16)), child: Text('نشط', style: context.bodySmallTextStyle.copyWith(color: darkGreen, fontWeight: FontWeight.bold))),
          Row(children: [Text('محفظة فودافون كاش', style: context.titleMediumTextStyle.copyWith(color: darkGreen, fontWeight: FontWeight.bold)), SizedBox(width: 12.aw), Container(padding: EdgeInsets.all(10.aw), decoration: const BoxDecoration(color: Color(0xFFF2EFE8), shape: BoxShape.circle), child: Icon(Icons.account_balance_wallet_outlined, color: darkGreen, size: 24.aw))]),
        ]),
        SizedBox(height: AppSpacing.md.ah), Divider(color: Colors.grey[200]), SizedBox(height: AppSpacing.md.ah),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(padding: EdgeInsets.symmetric(horizontal: 16.aw, vertical: 6.ah), decoration: BoxDecoration(color: const Color(0xFFF2EFE8), borderRadius: BorderRadius.circular(16)), child: Text('تعديل', style: context.bodyMediumTextStyle.copyWith(color: Colors.lightGreen, fontWeight: FontWeight.bold))),
          Text('رقم: ٠١٠***٥٦٧', style: context.bodyMediumTextStyle.copyWith(color: context.colors.textSecondary)),
        ]),
      ]),
    );
  }
}

class PayoutMethodRadio extends StatelessWidget {
  final int index, selectedIndex;
  final String title;
  final IconData icon;
  final Color darkGreen;
  final Function(int) onTap;

  const PayoutMethodRadio({super.key, required this.index, required this.selectedIndex, required this.title, required this.icon, required this.darkGreen, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final isSel = selectedIndex == index;
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.aw, vertical: AppSpacing.md.ah),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 8, offset: const Offset(0, 2))]),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(width: 20.aw, height: 20.aw, decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: isSel ? Colors.lightGreen : Colors.grey[400]!, width: 2)), child: isSel ? Center(child: Container(width: 10.aw, height: 10.aw, decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.lightGreen))) : null),
          Row(children: [Text(title, style: context.bodyLargeTextStyle.copyWith(color: darkGreen, fontWeight: FontWeight.bold)), SizedBox(width: 12.aw), Container(padding: EdgeInsets.all(8.aw), decoration: const BoxDecoration(color: Color(0xFFF2EFE8), shape: BoxShape.circle), child: Icon(icon, color: darkGreen, size: 24.aw))]),
        ]),
      ),
    );
  }
}











