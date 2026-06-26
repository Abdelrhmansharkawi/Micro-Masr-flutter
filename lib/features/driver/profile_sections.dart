import 'package:flutter/material.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/features/driver/driver_shared_widgets.dart';
import 'package:micromasr/features/driver/driver_document_center_screen.dart';
import 'package:micromasr/features/driver/driver_payout_settings_screen.dart';
import 'package:micromasr/features/driver/driver_personal_info_screen.dart';
import 'package:micromasr/features/driver/driver_report_issue_screen.dart';
import 'package:micromasr/features/driver/driver_support_screen.dart';
import 'package:micromasr/features/driver/driver_vehicle_details_screen.dart';
import 'package:micromasr/features/driver/profile_base_widgets.dart';

class WorkDataSection extends StatelessWidget {
  final Color darkGreen;
  const WorkDataSection({super.key, required this.darkGreen});
  @override
  Widget build(BuildContext context) {
    return ProfileBaseSection(title: 'بيانات العمل', children: [
      ProfileListTile(title: 'المعلومات الشخصية', icon: Icons.person_outline, darkGreen: darkGreen, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DriverPersonalInfoScreen()))),
      ProfileListTile(title: 'تفاصيل المركبة', subtitle: 'ميكروباص أ ب ج ١٢٣٤', icon: Icons.directions_bus_outlined, darkGreen: darkGreen, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DriverVehicleDetailsScreen()))),
      ProfileListTile(title: 'مركز الوثائق', subtitle: 'وثائق سارية ✓', subtitleColor: Colors.lightGreen, icon: Icons.description_outlined, darkGreen: darkGreen, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DriverDocumentCenterScreen()))),
    ]);
  }
}

class FinancialSection extends StatelessWidget {
  final Color darkGreen;
  const FinancialSection({super.key, required this.darkGreen});
  @override
  Widget build(BuildContext context) {
    return ProfileBaseSection(title: 'الإعدادات المالية', children: [
      ProfileListTile(title: 'إعدادات الصرف', subtitle: 'Vodafone Cash', icon: Icons.account_balance_wallet_outlined, darkGreen: darkGreen, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DriverPayoutSettingsScreen()))),
    ]);
  }
}

class PreferencesSection extends StatelessWidget {
  final Color darkGreen;
  const PreferencesSection({super.key, required this.darkGreen});
  @override
  Widget build(BuildContext context) {
    return ProfileBaseSection(title: 'التفضيلات', children: [
      ProfileListTile(title: 'اللغة', subtitle: 'العربية 🇪🇬', icon: Icons.language_outlined, darkGreen: darkGreen),
      ProfileListTile(title: 'التنبيهات', trailing: Switch(value: true, onChanged: (v) {}, activeThumbColor: darkGreen), icon: Icons.notifications_none_rounded, darkGreen: darkGreen),
    ]);
  }
}

class SupportSection extends StatelessWidget {
  final Color darkGreen, orangeColor;
  const SupportSection({super.key, required this.darkGreen, required this.orangeColor});
  @override
  Widget build(BuildContext context) {
    return ProfileBaseSection(title: 'الدعم', children: [
      ProfileListTile(title: 'مركز المساعدة', icon: Icons.help_outline_rounded, darkGreen: darkGreen, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DriverSupportScreen()))),
      ProfileListTile(title: 'البلاغات', icon: Icons.report_problem_outlined, darkGreen: darkGreen, iconColor: orangeColor, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DriverReportIssueScreen()))),
    ]);
  }
}

class LogoutButton extends StatelessWidget {
  final Color orangeColor;
  const LogoutButton({super.key, required this.orangeColor});
  @override
  Widget build(BuildContext context) {
    return DriverCard(padding: EdgeInsets.symmetric(vertical: 16.ah), borderRadius: 24, boxShadow: const [], color: Colors.white, child: Center(child: Text('تسجيل الخروج', style: context.titleMediumTextStyle.copyWith(color: orangeColor, fontWeight: FontWeight.bold))));
  }
}











