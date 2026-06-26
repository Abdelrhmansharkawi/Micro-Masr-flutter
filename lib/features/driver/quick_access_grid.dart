import 'package:flutter/material.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/features/driver/driver_shared_widgets.dart';

class QuickAccessSection extends StatelessWidget {
  final Color darkGreen;
  const QuickAccessSection({super.key, required this.darkGreen});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DriverSectionHeader(title: AppStrings.quickAccess),
        SizedBox(height: AppSpacing.md.ah),
        _QuickAccessGrid(darkGreen: darkGreen),
      ],
    );
  }
}

class _QuickAccessGrid extends StatelessWidget {
  final Color darkGreen;
  const _QuickAccessGrid({required this.darkGreen});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _QuickAccessBtn(title: AppStrings.myStats, icon: Icons.bar_chart_rounded, darkGreen: darkGreen)),
            SizedBox(width: AppSpacing.md.aw),
            Expanded(child: _QuickAccessBtn(title: AppStrings.myLocation, icon: Icons.location_on_outlined, darkGreen: darkGreen)),
          ],
        ),
        SizedBox(height: AppSpacing.md.ah),
        Row(
          children: [
            Expanded(child: _QuickAccessBtn(title: AppStrings.support, icon: Icons.support_agent_rounded, darkGreen: darkGreen)),
            SizedBox(width: AppSpacing.md.aw),
            Expanded(child: _QuickAccessBtn(title: AppStrings.myRoutes, icon: Icons.map_outlined, darkGreen: darkGreen)),
          ],
        ),
      ],
    );
  }
}

class _QuickAccessBtn extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color darkGreen;
  const _QuickAccessBtn({required this.title, required this.icon, required this.darkGreen});

  @override
  Widget build(BuildContext context) {
    return DriverCard(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.md.aw, vertical: 12.ah),
      borderRadius: 24,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: context.bodyMediumTextStyle.copyWith(color: darkGreen, fontWeight: FontWeight.w600)),
          SizedBox(width: AppSpacing.sm.aw),
          Container(
            padding: EdgeInsets.all(6.aw),
            decoration: const BoxDecoration(color: Color(0xFFF2EFE8), shape: BoxShape.circle),
            child: Icon(icon, color: darkGreen, size: 20.aw),
          ),
        ],
      ),
    );
  }
}











