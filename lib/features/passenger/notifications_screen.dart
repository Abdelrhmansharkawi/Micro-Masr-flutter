import 'package:flutter/material.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'notification_card.dart';
import 'notification_header.dart';
import 'package:micromasr/features/passenger/notification_entity.dart';


class NotificationItem {
  final String id;
  final String title;
  final String body;
  final String time;
  final NotificationType type;
  bool isRead;

  NotificationItem({
    required this.id,
    required this.title,
    required this.body,
    required this.time,
    required this.type,
    this.isRead = false,
  });
}

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final List<NotificationItem> _notifications = [
    NotificationItem(
      id: '1',
      title: 'تأكيد الحجز',
      body: 'تم تأكيد حجزك للرحلة المتجهة إلى الإسكندرية',
      time: '10:30 ص',
      type: NotificationType.booking,
    ),
    NotificationItem(
      id: '2',
      title: 'عرض جديد',
      body: 'استمتع بخصم 20% على رحلتك القادمة',
      time: '09:15 ص',
      type: NotificationType.offer,
    ),
    NotificationItem(
      id: '3',
      title: 'تحديث الرحلة',
      body: 'السائق في الطريق إليك',
      time: 'أمس',
      type: NotificationType.update,
    ),
  ];


  void _markAsRead(String id) {
    setState(() {
      _notifications.firstWhere((n) => n.id == id).isRead = true;
    });
  }

  void _markAllAsRead() {
    setState(() {
      for (var n in _notifications) {
        n.isRead = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final unreadCount = _notifications.where((n) => !n.isRead).length;

    return Scaffold(
      backgroundColor: context.colors.background,
      body: SafeArea(
        child: Column(
          children: [
            NotificationHeader(
              unreadCount: unreadCount,
              onMarkAllRead: _markAllAsRead,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20.aw),
                children: [
                  _buildSectionTitle(context, AppStrings.today),
                  ..._notifications
                      .where((n) => n.time.contains('Ã˜Âµ') || n.time.contains('Ã™â€¦'))
                      .map((n) => NotificationCard(
                            title: n.title,
                            body: n.body,
                            time: n.time,
                            type: n.type,
                            isRead: n.isRead,
                            onTap: () => _markAsRead(n.id),
                          )),
                  SizedBox(height: 16.ah),
                  _buildSectionTitle(context, AppStrings.yesterday),
                  ..._notifications
                      .where((n) => n.time.contains(AppStrings.yesterday))
                      .map((n) => NotificationCard(
                            title: n.title,
                            body: n.body,
                            time: n.time,
                            type: n.type,
                            isRead: n.isRead,
                            onTap: () => _markAsRead(n.id),
                          )),
                  SizedBox(height: 32.ah),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.ah),
      child: Text(
        title,
        textAlign: TextAlign.end,
        style: context.bodyMediumTextStyle.copyWith(
          color: context.colors.textSecondary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}












