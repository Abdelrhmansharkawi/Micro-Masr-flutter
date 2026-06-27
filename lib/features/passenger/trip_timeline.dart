import 'package:flutter/material.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/horizontal_space.dart';
import 'package:micromasr/core/vertical_space.dart';
import 'package:micromasr/features/passenger/data/models/trip_model.dart';


class TripTimeline extends StatelessWidget {
  final TripModel trip; 
  const TripTimeline({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> timelineItems = [];
    timelineItems.add({
      'name': trip.startLocation.name ?? 'نقطة البداية',
      'time': 'الآن',
      'color': const Color(0xFF558B2F),
      'showLine': true,
    });
    for (int i = 0; i < trip.stops.length; i++) {
      timelineItems.add({
        'name': trip.stops[i],
        'time': '+${i + 3} دقيقة',
        'color': const Color(0xFF9CCC65),
        'showLine': i < trip.stops.length - 1,
      });
    }
    final durationMinutes = trip.estimatedDuration ;
    final totalMinutes = durationMinutes;
    timelineItems.add({
      'name': trip.endLocation.name ?? 'الوجهة النهائية',
      'time': '+$totalMinutes دقيقة',
      'color': const Color(0xFFF09063),
      'showLine': false,
    });

    return Container(
      padding: EdgeInsets.all(20.aw),
      decoration: BoxDecoration(
          color: context.colors.surface,
          borderRadius: BorderRadius.circular(32)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                  width: 4.aw, height: 16.ah, color: context.colors.primary),
              const HorizontalSpace(8),
              Text(AppStrings.tripStations,
                  style: context.bodyLargeTextStyle
                      .copyWith(fontWeight: FontWeight.bold)),
            ],
          ),
          const VerticalSpace(20),
          ...timelineItems.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;
            return _buildTimelineItem(
              context,
              item['name'] as String,
              item['time'] as String,
              item['color'] as Color,
              item['showLine'] as bool,
              index == 0, 
            );
          }),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(BuildContext context, String name, String time,
      Color color, bool showLine, bool isFirst) {
    return SizedBox(
      height: 60.ah,
      child: Row(
        children: [
          Column(
            children: [
              Container(
                  width: 16.aw,
                  height: 16.aw,
                  decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3),
                      boxShadow: [
                        BoxShadow(
                            color: color.withValues(alpha: 0.3), blurRadius: 5)
                      ])),
              if (showLine)
                Expanded(
                    child: Container(
                        width: 2.aw,
                        color: context.colors.outline.withValues(alpha: 0.5))),
            ],
          ),
          const HorizontalSpace(16),
          Text(name,
              style: context.bodyLargeTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.colors.onSurface)),
          const Spacer(),
          Text(time,
              style: context.bodyMediumTextStyle
                  .copyWith(color: color, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
