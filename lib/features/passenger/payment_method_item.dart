import 'package:flutter/material.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/horizontal_space.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({
    super.key,
    required this.label,
    this.subtitle,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final String? subtitle;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: context.colors.surface,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: isSelected ? const Color(0xFF9CCC65) : Colors.transparent,
            width: 2,
          ),
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10)],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: context.colors.background, shape: BoxShape.circle),
              child: Icon(icon, color: context.colors.textSecondary, size: 24),
            ),
            const HorizontalSpace(16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: context.titleMediumTextStyle.copyWith(fontWeight: FontWeight.bold)),
                if (subtitle != null) Text(subtitle!, style: context.bodySmallTextStyle.copyWith(color: context.colors.textSecondary)),
              ],
            ),
            const Spacer(),
            _buildSelector(),
          ],
        ),
      ),
    );
  }

  Widget _buildSelector() {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: isSelected ? const Color(0xFF9CCC65) : Colors.grey.shade400, width: 2),
      ),
      child: isSelected ? const Icon(Icons.check, size: 16, color: Color(0xFF9CCC65)) : null,
    );
  }
}











