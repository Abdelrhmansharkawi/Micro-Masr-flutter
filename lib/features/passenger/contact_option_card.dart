import 'package:flutter/material.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/app_card.dart';

class ContactOptionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;
  final VoidCallback onTap;

  const ContactOptionCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AppCard(
        padding: EdgeInsets.all(16.aw),
        child: Row(
          children: [
            Icon(Icons.arrow_back_ios_new_rounded, size: 16.aw, color: context.colors.textSecondary),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  label,
                  style: context.bodySmallTextStyle.copyWith(color: context.colors.textSecondary),
                ),
                Text(
                  value,
                  style: context.titleSmallTextStyle.copyWith(fontWeight: FontWeight.bold, color: context.colors.primary),
                ),
              ],
            ),
            const SizedBox(width: 16),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 24.aw),
            ),
          ],
        ),
      ),
    );
  }
}











