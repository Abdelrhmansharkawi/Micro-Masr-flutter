import 'package:flutter/material.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/horizontal_space.dart';

class NotificationHeader extends StatelessWidget {
  final int unreadCount;
  final VoidCallback onMarkAllRead;

  const NotificationHeader({
    super.key,
    required this.unreadCount,
    required this.onMarkAllRead,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.aw, vertical: 16.ah),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: onMarkAllRead,
            child: Text(
              AppStrings.markAllAsRead,
              style: context.bodyMediumTextStyle.copyWith(
                color: const Color(0xFF9CCC65),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: [
              if (unreadCount > 0)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.aw, vertical: 4.ah),
                  decoration: BoxDecoration(
                    color: context.colors.background,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '$unreadCount',
                    style: context.labelSmallTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.colors.primary,
                    ),
                  ),
                ),
              const HorizontalSpace(12),
              Text(
                AppStrings.notifications,
                style: context.headlineLargeTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.colors.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}











