import 'package:flutter/material.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/horizontal_space.dart';
import 'package:micromasr/core/vertical_space.dart';
import 'package:go_router/go_router.dart';
import 'package:micromasr/core/app_route_constant.dart';

class LocationInputCard extends StatelessWidget {
  const LocationInputCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.aw),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Stack(
        alignment: AlignmentDirectional.centerEnd,
        children: [
          Column(
            children: [
              _buildInputRow(
                context,
                AppStrings.currentLocation,
                Icons.my_location,
                const Color(0xFF9CCC65),
                Icons.close,
                onTap: null,
              ),
              const VerticalSpace(12),
              _buildInputRow(
                context,
                AppStrings.whereTo,
                Icons.square,
                const Color(0xFFF09063),
                Icons.mic_none,
                onTap: () => context.go(AppRouteConstants.passengerRides),
              ),
            ],
          ),
          _buildExchangeIcon(context),
        ],
      ),
    );
  }

  Widget _buildInputRow(
    BuildContext context,
    String text,
    IconData icon,
    Color iconColor,
    IconData actionIcon, {
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.aw, vertical: 8.ah),
        decoration: BoxDecoration(
          color: context.colors.background,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: iconColor, size: 20.aw),
            const HorizontalSpace(12),
            Text(
              text,
              style: context.bodyLargeTextStyle.copyWith(
                color: context.colors.onSurface,
              ),
            ),
            const Spacer(),
            Icon(actionIcon, color: context.colors.textSecondary, size: 20.aw),
          ],
        ),
      ),
    );
  }

  Widget _buildExchangeIcon(BuildContext context) {
    return Positioned.directional(
      textDirection: TextDirection.rtl,
      start: 4.aw,
      top: 35.ah,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: context.colors.background,
            shape: BoxShape.circle,
            border: Border.all(color: context.colors.surface, width: 2)),
        child: Icon(Icons.swap_vert,
            color: context.colors.textSecondary, size: 16.aw),
      ),
    );
  }
}
