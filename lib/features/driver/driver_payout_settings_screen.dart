import 'package:flutter/material.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/features/driver/payout_widgets.dart';
import 'package:micromasr/features/driver/profile_base_widgets.dart';

class DriverPayoutSettingsScreen extends StatefulWidget {
  const DriverPayoutSettingsScreen({super.key});
  @override
  State<DriverPayoutSettingsScreen> createState() => _DriverPayoutSettingsScreenState();
}

class _DriverPayoutSettingsScreenState extends State<DriverPayoutSettingsScreen> {
  int _selectedNewMethod = -1;

  @override
  Widget build(BuildContext context) {
    const darkGreen = Color(0xFF4A7450), orangeColor = Color(0xFFE28B5A);
    return Scaffold(
      backgroundColor: const Color(0xFFF2EFE8),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.aw, vertical: AppSpacing.md.ah),
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            const ProfileHeader(title: 'إعدادات الصرف', darkGreen: darkGreen),
            SizedBox(height: AppSpacing.xl.ah),
            const CurrentPayoutCard(darkGreen: darkGreen),
            SizedBox(height: AppSpacing.xl.ah),
            const ProfileSectionHeader(title: 'إضافة وسيلة صرف جديدة', darkGreen: darkGreen),
            SizedBox(height: AppSpacing.md.ah),
            PayoutMethodRadio(index: 0, selectedIndex: _selectedNewMethod, title: 'حساب بنكي (Eban)', icon: Icons.account_balance_rounded, darkGreen: darkGreen, onTap: (i) => setState(() => _selectedNewMethod = i)),
            SizedBox(height: AppSpacing.md.ah),
            PayoutMethodRadio(index: 1, selectedIndex: _selectedNewMethod, title: 'إنستا باي', icon: Icons.payments_outlined, darkGreen: darkGreen, onTap: (i) => setState(() => _selectedNewMethod = i)),
            SizedBox(height: 64.ah),
            _buildConfirmButton(orangeColor),
            SizedBox(height: AppSpacing.md.ah),
            Text('تحويل الأرباح يتم في يوم الخميس من كل أسبوع.', textAlign: TextAlign.center, style: context.bodySmallTextStyle.copyWith(color: Colors.lightGreen)),
          ]),
        ),
      ),
    );
  }

  Widget _buildConfirmButton(Color orangeColor) {
    return Container(
      width: double.infinity, padding: EdgeInsets.symmetric(vertical: 16.ah),
      decoration: BoxDecoration(color: orangeColor, borderRadius: BorderRadius.circular(32)),
      alignment: Alignment.center, child: Text('تأكيد الوسيلة الأساسية', style: context.titleMediumTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
    );
  }
}











