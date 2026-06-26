import 'package:flutter/material.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/horizontal_space.dart';

class ProfileStatsRow extends StatelessWidget {
  final int trips;
  final double rating;
  final double balance;

  const ProfileStatsRow({
    super.key,
    required this.trips,
    required this.rating,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.aw),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _StatPill(
            label: '$trips رحلة',
            icon: Icons.directions_bus_outlined,
          ),
          _StatPill(
            label: rating.toStringAsFixed(1),
            icon: Icons.star,
            showIconSuffix: true,
          ),
          _StatPill(
            label: '${balance.toInt()} ج',
            icon: Icons.account_balance_wallet_outlined,
          ),
        ],
      ),
    );
  }
}

class _StatPill extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool showIconSuffix;

  const _StatPill({
    required this.label,
    required this.icon,
    this.showIconSuffix = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.aw, vertical: 8.ah),
      decoration: BoxDecoration(
        color: const Color(0xFF4A7450).withValues(alpha: 0.8), // Semi-transparent dark green
        borderRadius: BorderRadius.circular(20.ar),
      ),
      child: Row(
        children: [
          if (!showIconSuffix) Icon(icon, color: Colors.white, size: 16.aw),
          if (!showIconSuffix) const HorizontalSpace(6),
          Text(
            label,
            style: context.labelLargeTextStyle.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (showIconSuffix) const HorizontalSpace(4),
          if (showIconSuffix) Icon(icon, color: Colors.amber, size: 16.aw),
        ],
      ),
    );
  }
}











