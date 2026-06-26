import 'package:flutter/material.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/app_button.dart';
import 'package:micromasr/core/vertical_space.dart';
import 'package:go_router/go_router.dart';
import 'package:micromasr/core/app_route_constant.dart';
import 'package:micromasr/features/passenger/profile_app_bar.dart';
import 'package:micromasr/features/passenger/profile_section.dart';
import 'package:micromasr/features/passenger/notification_switch_row.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/features/passenger/data/services/notification_settings_service.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  final NotificationSettingsService _settingsService =
      NotificationSettingsService();
  Map<String, bool> _settings = {};
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    try {
      final settings = await _settingsService.getSettings();
      setState(() {
        _settings = settings;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = 'فشل في تحميل الإعدادات';
        _isLoading = false;
      });
    }
  }

  Future<void> _saveSettings() async {
    try {
      await _settingsService.updateSettings(_settings);
      if (mounted) {
        context.go(AppRouteConstants.passengerProfile);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('حدث خطأ أثناء حفظ الإعدادات')),
      );
    }
  }

  void _updateSetting(String key, bool value) {
    setState(() {
      _settings[key] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        backgroundColor: Color(0xFFF2EFE8),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_error != null) {
      return Scaffold(
        backgroundColor: const Color(0xFFF2EFE8),
        body: Center(child: Text(_error!)),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF2EFE8),
      appBar: const ProfileAppBar(title: 'إعدادات التنبيهات'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.aw),
        child: Column(
          children: [
            Text(
              'تحكم في كيفية وصول التنبيهات إليك',
              style: context.bodySmallTextStyle
                  .copyWith(color: context.colors.textSecondary),
            ),
            const VerticalSpace(24),

            // تنبيهات الرحلات
            ProfileSection(
              title: 'تنبيهات الرحلات',
              children: [
                NotificationSwitchRow(
                  label: 'تحديثات حالة الحجز',
                  value: _settings['bookingUpdates'] ?? true,
                  onChanged: (v) => _updateSetting('bookingUpdates', v),
                ),
                NotificationSwitchRow(
                  label: 'وصول الميكروباص',
                  value: _settings['microbusArrival'] ?? true,
                  onChanged: (v) => _updateSetting('microbusArrival', v),
                ),
                NotificationSwitchRow(
                  label: AppStrings.rateYourTrip,
                  value: _settings['tripRating'] ?? true,
                  onChanged: (v) => _updateSetting('tripRating', v),
                ),
              ],
            ),

            const VerticalSpace(24),

            // العروض والأخبار
            ProfileSection(
              title: 'العروض والأخبار',
              children: [
                NotificationSwitchRow(
                  label: 'كوبونات خصم جديدة',
                  value: _settings['newCoupons'] ?? true,
                  onChanged: (v) => _updateSetting('newCoupons', v),
                ),
                NotificationSwitchRow(
                  label: 'أخبار النظام',
                  value: _settings['systemNews'] ?? false,
                  onChanged: (v) => _updateSetting('systemNews', v),
                ),
              ],
            ),

            const VerticalSpace(24),

            // طرق التنبيه
            ProfileSection(
              title: 'طرق التنبيه',
              children: [
                NotificationSwitchRow(
                  label: 'إشعارات الهاتف (Push)',
                  value: _settings['pushEnabled'] ?? true,
                  onChanged: (v) => _updateSetting('pushEnabled', v),
                ),
                NotificationSwitchRow(
                  label: 'رسائل نصية (SMS)',
                  value: _settings['smsEnabled'] ?? false,
                  onChanged: (v) => _updateSetting('smsEnabled', v),
                ),
                NotificationSwitchRow(
                  label: 'البريد الإلكتروني',
                  value: _settings['emailEnabled'] ?? false,
                  onChanged: (v) => _updateSetting('emailEnabled', v),
                ),
              ],
            ),

            const VerticalSpace(40),
            AppButton(
              label: 'حفظ الإعدادات',
              onPressed: _saveSettings,
            ),
            const VerticalSpace(40),
          ],
        ),
      ),
    );
  }
}
