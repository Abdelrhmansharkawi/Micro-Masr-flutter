import 'package:flutter/material.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';

class ActiveTripStepper extends StatelessWidget {
  final Color darkGreen;
  const ActiveTripStepper({super.key, required this.darkGreen});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.md.aw, vertical: AppSpacing.md.ah),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.95),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildStep(context, title: 'وصلتوا!', icon: Icons.check, isActive: false),
          Expanded(child: Divider(color: Colors.grey[300], thickness: 2)),
          _buildStep(context, title: 'الراكب\nمعاك', icon: Icons.person, isActive: false),
          Expanded(child: Divider(color: darkGreen, thickness: 2)),
          _buildStep(context, title: 'في الطريق\nللراكب', icon: Icons.directions_bus, isActive: true, activeColor: darkGreen),
        ],
      ),
    );
  }

  Widget _buildStep(BuildContext context, {required String title, required IconData icon, required bool isActive, Color? activeColor}) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8.aw),
          decoration: BoxDecoration(color: isActive ? activeColor : const Color(0xFFF2EFE8), shape: BoxShape.circle),
          child: Icon(icon, color: isActive ? Colors.white : Colors.black54, size: 20.aw),
        ),
        SizedBox(height: 4.ah),
        Text(
          title, textAlign: TextAlign.center,
          style: context.bodySmallTextStyle.copyWith(
            color: isActive ? activeColor : Colors.black54,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}











