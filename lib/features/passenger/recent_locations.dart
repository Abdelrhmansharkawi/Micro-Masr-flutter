import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/app_route_constant.dart';
import 'package:micromasr/core/horizontal_space.dart';
import 'package:micromasr/core/vertical_space.dart';

class RecentLocations extends StatelessWidget {
  const RecentLocations({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(width: 4.aw, height: 20.ah, color: context.colors.primary),
            const HorizontalSpace(8),
            Text(
              AppStrings.recentLocationsTitle,
              style: context.headlineMediumTextStyle.copyWith(
                color: context.colors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const VerticalSpace(16),
        Container(
          padding: EdgeInsets.all(16.aw),
          decoration: BoxDecoration(
            color: context.colors.surface,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            children: [
              _buildLocationItem(context, 'سيتي ستارز مول', 'شارع عمر بن الخطاب، مدينة نصر'),
              const Divider(height: 32),
              _buildLocationItem(context, 'نادي الصيد', 'الدقي، الجيزة'),
              const Divider(height: 32),
              _buildLocationItem(context, 'مستشفى دار الفؤاد', 'السادس من أكتوبر'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLocationItem(BuildContext context, String title, String subtitle) {
    return GestureDetector(
      onTap: () => context.push(AppRouteConstants.passengerRides),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: context.colors.background, shape: BoxShape.circle),
            child: Icon(Icons.access_time, color: context.colors.textSecondary, size: 20.aw),
          ),
          const HorizontalSpace(16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.titleMediumTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.colors.primary,
                ),
              ),
              Text(
                subtitle,
                style: context.bodySmallTextStyle.copyWith(color: context.colors.textSecondary),
              ),
            ],
          ),
          const Spacer(),
          Icon(Icons.chevron_left, color: context.colors.textSecondary, size: 20.aw),
        ],
      ),
    );
  }
}











