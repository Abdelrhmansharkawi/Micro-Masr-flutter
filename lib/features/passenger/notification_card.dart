import 'package:flutter/material.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/horizontal_space.dart';
import 'package:micromasr/features/passenger/notification_entity.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String body;
  final String time;
  final NotificationType type;
  final bool isRead;
  final VoidCallback onTap;

  const NotificationCard({
    super.key,
    required this.title,
    required this.body,
    required this.time,
    required this.type,
    required this.isRead,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final (icon, iconColor, bgIndicator) = _getNotificationStyle(type);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 16.ah),
        padding: EdgeInsets.all(16.aw),
        decoration: BoxDecoration(
          color: context.colors.surface,
          borderRadius: BorderRadius.circular(24.aw),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [
              if (!isRead)
                Container(
                  width: 4.aw,
                  decoration: BoxDecoration(
                    color: bgIndicator,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              if (!isRead) const HorizontalSpace(12),
              
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              time,
                              style: context.labelSmallTextStyle.copyWith(
                                color: context.colors.textSecondary,
                              ),
                            ),
                            if (!isRead) ...[
                              const HorizontalSpace(4),
                              Container(
                                width: 8.aw,
                                height: 8.aw,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFF09063),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ],
                          ],
                        ),
                        Expanded(
                          child: Text(
                            title,
                            textAlign: TextAlign.end,
                            style: context.titleMediumTextStyle.copyWith(
                              fontWeight: FontWeight.bold,
                              color: context.colors.onSurface,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.ah),
                    Text(
                      body,
                      textAlign: TextAlign.end,
                      style: context.bodySmallTextStyle.copyWith(
                        color: context.colors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              const HorizontalSpace(16),
              Container(
                width: 48.aw,
                height: 48.aw,
                decoration: BoxDecoration(
                  color: context.colors.background,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: iconColor, size: 24.aw),
              ),
            ],
          ),
        ),
      ),
    );
  }

  (IconData, Color, Color) _getNotificationStyle(NotificationType type) {
    switch (type) {
      case NotificationType.booking:
        return (Icons.check_circle_outline, const Color(0xFF9CCC65), const Color(0xFF9CCC65));
      case NotificationType.driver:
        return (Icons.directions_bus_outlined, const Color(0xFF455A64), const Color(0xFF455A64));
      case NotificationType.payment:
        return (Icons.credit_card_outlined, const Color(0xFF9CCC65), const Color(0xFF9CCC65));
      case NotificationType.offer:
        return (Icons.card_giftcard, const Color(0xFFF09063), const Color(0xFFF09063));
      case NotificationType.review:
        return (Icons.star_outline, const Color(0xFF9CCC65), const Color(0xFF9CCC65));
      case NotificationType.reminder:
        return (Icons.history, const Color(0xFF455A64), const Color(0xFF455A64));
      case NotificationType.update:
        return (Icons.info_outline, const Color(0xFF455A64), const Color(0xFF455A64));
    }
  }
}











