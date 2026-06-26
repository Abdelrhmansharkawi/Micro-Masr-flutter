import 'package:flutter/material.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/app_card.dart';
import 'package:micromasr/core/horizontal_space.dart';

class SavedPlaceItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String address;
  final VoidCallback? onDelete;

  const SavedPlaceItem({
    super.key,
    required this.icon,
    required this.label,
    required this.address,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      margin: EdgeInsets.only(bottom: 16.ah),
      padding: EdgeInsets.all(16.aw),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
            onPressed: onDelete,
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                label,
                style: context.titleSmallTextStyle.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                address,
                style: context.bodySmallTextStyle.copyWith(color: context.colors.textSecondary),
              ),
            ],
          ),
          const HorizontalSpace(16),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: context.colors.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: context.colors.primary, size: 20.aw),
          ),
        ],
      ),
    );
  }
}











