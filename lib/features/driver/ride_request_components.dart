import 'package:flutter/material.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';

class PassengerInfoRow extends StatelessWidget {
  final Color orangeColor, darkGreen;
  const PassengerInfoRow({super.key, required this.orangeColor, required this.darkGreen});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.aw, vertical: 6.ah),
          decoration: BoxDecoration(
            color: orangeColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Text(
                '٤.٨',
                style: context.bodyMediumTextStyle.copyWith(
                  color: orangeColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 4.aw),
              Icon(Icons.star, color: orangeColor, size: 16.aw),
            ],
          ),
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'محمد جلال',
              style: context.titleMediumTextStyle.copyWith(
                color: darkGreen,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                StatusBadge(text: 'راكب دائم', darkGreen: darkGreen),
                SizedBox(width: 8.aw),
                Text(
                  '٤٢ رحلة سابقة',
                  style: context.bodySmallTextStyle.copyWith(color: context.colors.textSecondary),
                ),
              ],
            ),
          ],
        ),
        SizedBox(width: 12.aw),
        CircleAvatar(
          radius: 28.aw,
          backgroundColor: Colors.teal[700],
          child: Icon(Icons.person, color: Colors.white, size: 32.aw),
        ),
      ],
    );
  }
}

class StatusBadge extends StatelessWidget {
  final String text;
  final Color darkGreen;
  const StatusBadge({super.key, required this.text, required this.darkGreen});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.aw, vertical: 2.ah),
      decoration: BoxDecoration(
        color: Colors.lightGreen.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.keyboard_arrow_down, color: darkGreen, size: 12.aw),
          Text(
            text,
            style: context.bodySmallTextStyle.copyWith(
              color: darkGreen,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class LocationInfoRow extends StatelessWidget {
  final Color darkGreen, orangeColor;
  const LocationInfoRow({super.key, required this.darkGreen, required this.orangeColor});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'نقطة الركوب',
              style: context.bodySmallTextStyle.copyWith(color: context.colors.textSecondary),
            ),
            Text(
              'محطة مصر',
              style: context.titleMediumTextStyle.copyWith(
                color: darkGreen,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: AppSpacing.lg.ah),
            Text(
              'الوجهة',
              style: context.bodySmallTextStyle.copyWith(color: context.colors.textSecondary),
            ),
            Text(
              'الجامعة',
              style: context.titleMediumTextStyle.copyWith(
                color: darkGreen,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(width: 16.aw),
        _Visualizer(orangeColor: orangeColor),
      ],
    );
  }
}

class _Visualizer extends StatelessWidget {
  final Color orangeColor;
  const _Visualizer({required this.orangeColor});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 16.aw,
          height: 16.aw,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.lightGreen, width: 4),
          ),
        ),
        Container(width: 2.aw, height: 40.ah, color: Colors.grey[300]),
        Container(
          width: 16.aw,
          height: 16.aw,
          decoration: BoxDecoration(
            color: orangeColor.withValues(alpha: 0.2),
            border: Border.all(color: orangeColor, width: 4),
          ),
        ),
      ],
    );
  }
}

class RideDetailsChips extends StatelessWidget {
  const RideDetailsChips({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const _Chip(text: '١٢ دقيقة', icon: Icons.access_time),
            SizedBox(width: 8.aw),
            const _Chip(text: '٢ مقاعد', icon: Icons.airline_seat_recline_normal),
          ],
        ),
        SizedBox(height: 8.ah),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [const _Chip(text: '٣.٢ كم', icon: Icons.route)],
        ),
      ],
    );
  }
}

class _Chip extends StatelessWidget {
  final String text;
  final IconData icon;
  const _Chip({required this.text, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.aw, vertical: 8.ah),
      decoration: BoxDecoration(
        color: const Color(0xFFF2EFE8),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: context.bodyMediumTextStyle.copyWith(
              color: const Color(0xFF101B15),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 6.aw),
          Icon(icon, size: 16.aw, color: const Color(0xFF101B15)),
        ],
      ),
    );
  }
}

class RideMapThumbnail extends StatelessWidget {
  final Color orangeColor;
  const RideMapThumbnail({super.key, required this.orangeColor});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 100.ah,
        width: double.infinity,
        color: Colors.grey[300],
        child: Stack(
          children: [
            Center(
              child: Container(
                height: 2,
                width: double.infinity,
                color: orangeColor.withValues(alpha: 0.5),
              ),
            ),
            Positioned(left: 40.aw, top: 40.ah, child: Icon(Icons.flag, color: orangeColor)),
            Positioned(
              right: 40.aw,
              bottom: 40.ah,
              child: const Icon(Icons.location_on, color: Colors.lightGreen),
            ),
          ],
        ),
      ),
    );
  }
}











