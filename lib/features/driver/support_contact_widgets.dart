import 'package:flutter/material.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';

class ContactCard extends StatelessWidget {
  final String title, subtitle;
  final IconData icon;
  final Color iconColor, iconBgColor, darkGreen;
  const ContactCard({super.key, required this.title, required this.subtitle, required this.icon, required this.iconColor, required this.iconBgColor, required this.darkGreen});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.md.aw),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 10, offset: const Offset(0, 4))]),
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        Column(crossAxisAlignment: CrossAxisAlignment.end, children: [Text(title, style: context.bodyLargeTextStyle.copyWith(color: darkGreen, fontWeight: FontWeight.bold)), Text(subtitle, style: context.bodySmallTextStyle.copyWith(color: context.colors.textSecondary))]),
        SizedBox(width: AppSpacing.md.aw),
        Container(padding: EdgeInsets.all(12.aw), decoration: BoxDecoration(color: iconBgColor, shape: BoxShape.circle), child: Icon(icon, color: iconColor, size: 24.aw)),
      ]),
    );
  }
}

class NewTicketButton extends StatelessWidget {
  const NewTicketButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, padding: EdgeInsets.symmetric(vertical: 16.ah),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(32), border: Border.all(color: Colors.lightGreen)),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.add_circle_outline, color: Colors.lightGreen), SizedBox(width: 8.aw), Text('فتح تذكرة دعم جديدة', style: context.titleMediumTextStyle.copyWith(color: Colors.lightGreen, fontWeight: FontWeight.bold))]),
    );
  }
}











