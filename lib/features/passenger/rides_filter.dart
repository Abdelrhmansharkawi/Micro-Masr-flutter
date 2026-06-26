import 'package:flutter/material.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/horizontal_space.dart';

class RidesFilter extends StatelessWidget {
  const RidesFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 20.aw),
      child: Row(
        children: [
          _buildFilterChip(context, AppStrings.all, true),
          const HorizontalSpace(12),
          _buildFilterChip(context, AppStrings.nearest, false),
          const HorizontalSpace(12),
          _buildFilterChip(context, AppStrings.cheapest, false),
          const HorizontalSpace(12),
          _buildFilterChip(context, AppStrings.seatsAvailableCount, false),
        ],
      ),
    );
  }

  Widget _buildFilterChip(BuildContext context, String label, bool isActive) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.aw, vertical: 8.ah),
      decoration: BoxDecoration(
        color: isActive ? context.colors.primary : context.colors.surface,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: isActive ? context.colors.primary : context.colors.outline.withValues(alpha: 0.5)),
      ),
      child: Text(
        label,
        style: context.bodyMediumTextStyle.copyWith(
          color: isActive ? Colors.white : context.colors.primary,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}











