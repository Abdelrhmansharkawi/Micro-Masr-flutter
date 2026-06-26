import 'package:flutter/material.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';

class HomeHeader extends StatelessWidget {
  final Color darkGreen;
  const HomeHeader({super.key, required this.darkGreen});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            _NotificationIcon(darkGreen: darkGreen),
            SizedBox(width: AppSpacing.md.aw),
            Icon(Icons.settings_outlined, color: darkGreen, size: 28.aw),
          ],
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(AppStrings.driverWelcome, style: context.titleMediumTextStyle.copyWith(color: darkGreen, fontWeight: FontWeight.bold)),
                Text(AppStrings.driverRank, style: context.bodyMediumTextStyle.copyWith(color: Colors.amber[600], fontWeight: FontWeight.w600)),
              ],
            ),
            SizedBox(width: AppSpacing.sm.aw),
            CircleAvatar(radius: 22.aw, backgroundColor: context.colors.primaryContainer, child: Icon(Icons.person, color: darkGreen)),
          ],
        ),
      ],
    );
  }
}

class _NotificationIcon extends StatelessWidget {
  final Color darkGreen;
  const _NotificationIcon({required this.darkGreen});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Icon(Icons.notifications_none_rounded, color: darkGreen, size: 28.aw),
        Positioned(
          right: -2, top: -2,
          child: Container(
            padding: EdgeInsets.all(4.aw),
            decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
            child: Text('٢', style: context.bodySmallTextStyle.copyWith(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }
}











