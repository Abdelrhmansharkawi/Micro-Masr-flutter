import 'package:flutter/material.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/features/driver/driver_shared_widgets.dart';

class StatusToggleCard extends StatelessWidget {
  final Color darkGreen;
  final bool isOnline;
  final Function(bool) onToggle;

  const StatusToggleCard({
    super.key, 
    required this.darkGreen, 
    required this.isOnline,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return DriverCard(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              AppStrings.currentStatus, 
              style: context.titleMediumTextStyle.copyWith(color: darkGreen, fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(height: AppSpacing.md.ah),
          _ToggleButton(isOnline: isOnline, darkGreen: darkGreen, onToggle: onToggle),
          SizedBox(height: AppSpacing.md.ah),
          Text(
            isOnline ? AppStrings.visibleToPassengers : AppStrings.invisibleToPassengers,
            style: context.bodyMediumTextStyle.copyWith(
              color: isOnline ? Colors.lightGreen : context.colors.textSecondary, 
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _ToggleButton extends StatelessWidget {
  final bool isOnline;
  final Color darkGreen;
  final Function(bool) onToggle;

  const _ToggleButton({
    required this.isOnline, 
    required this.darkGreen,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onToggle(!isOnline),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 60.ah,
        decoration: BoxDecoration(
          color: isOnline ? darkGreen : context.colors.outline.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Stack(
          children: [
            Center(
              child: Text(
                isOnline ? AppStrings.availableForTrips : AppStrings.driverOffline,
                style: context.titleMediumTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              left: isOnline ? 4.aw : MediaQuery.of(context).size.width - 120.aw,
              top: 4.ah, bottom: 4.ah,
              child: Container(
                width: 52.aw,
                decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: Icon(
                  Icons.power_settings_new_rounded, 
                  color: isOnline ? darkGreen : context.colors.textSecondary, 
                  size: 28.aw,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}












