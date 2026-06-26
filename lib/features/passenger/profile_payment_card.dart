import 'package:flutter/material.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/app_card.dart';

class ProfilePaymentCard extends StatelessWidget {
  final String label;
  final String subtitle;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const ProfilePaymentCard({
    super.key,
    required this.label,
    required this.subtitle,
    required this.icon,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AppCard(
        margin: EdgeInsets.only(bottom: 16.ah),
        padding: EdgeInsets.all(16.aw),
        borderColor: isSelected ? context.colors.primary : null,
        child: Row(
          children: [
            if (isSelected)
              Icon(Icons.check_circle, color: context.colors.primary, size: 24.aw)
            else
              Container(
                width: 24.aw,
                height: 24.aw,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: context.colors.outline.withValues(alpha: 0.3), width: 2),
                ),
              ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  label,
                  style: context.titleSmallTextStyle.copyWith(fontWeight: FontWeight.bold, color: context.colors.primary),
                ),
                Text(
                  subtitle,
                  style: context.bodySmallTextStyle.copyWith(color: context.colors.textSecondary),
                ),
              ],
            ),
            const SizedBox(width: 16),
            Icon(icon, color: context.colors.primary, size: 24.aw),
          ],
        ),
      ),
    );
  }
}











