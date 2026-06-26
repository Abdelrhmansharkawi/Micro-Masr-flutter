import 'package:flutter/material.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/features/driver/support_contact_widgets.dart';
import 'package:micromasr/features/driver/support_faq_widgets.dart';
import 'package:micromasr/features/driver/support_header_widgets.dart';

class DriverSupportScreen extends StatefulWidget {
  const DriverSupportScreen({super.key});
  @override
  State<DriverSupportScreen> createState() => _DriverSupportScreenState();
}

class _DriverSupportScreenState extends State<DriverSupportScreen> {
  int _expandedIndex = 0;

  @override
  Widget build(BuildContext context) {
    const darkGreen = Color(0xFF4A7450);
    return Scaffold(
      backgroundColor: const Color(0xFFF2EFE8),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.aw, vertical: AppSpacing.md.ah),
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            SupportSearchHeader(darkGreen: darkGreen),
            SizedBox(height: AppSpacing.lg.ah),
            const SupportFilterChips(),
            SizedBox(height: AppSpacing.xl.ah),
            _buildFaqList(darkGreen),
            SizedBox(height: AppSpacing.xl.ah),
            Text('تواصل مباشر', textAlign: TextAlign.right, style: context.titleMediumTextStyle.copyWith(color: darkGreen, fontWeight: FontWeight.bold)),
            SizedBox(height: AppSpacing.md.ah),
            ContactCard(title: 'الدعم الفني المباشر', subtitle: 'متاح ٢٤ ساعة', icon: Icons.chat_bubble_outline, iconColor: const Color(0xFFE28B5A), iconBgColor: const Color(0xFFE28B5A).withValues(alpha: 0.1), darkGreen: darkGreen),
            SizedBox(height: AppSpacing.md.ah),
            ContactCard(title: 'مكتب الدعم الميداني', subtitle: 'الفرع الرئيسي - المنصورة', icon: Icons.location_on_outlined, iconColor: darkGreen, iconBgColor: darkGreen.withValues(alpha: 0.1), darkGreen: darkGreen),
            SizedBox(height: 32.ah),
            const NewTicketButton(),
            SizedBox(height: AppSpacing.xl.ah),
          ]),
        ),
      ),
    );
  }

  Widget _buildFaqList(Color darkGreen) {
    return Column(children: [
      FaqItem(index: 0, expandedIndex: _expandedIndex, title: 'إزاي أسحب أرباحي لمحفظتي؟', content: 'تروح على تبويب الأرباح، ونضغط سحب الأرباح، المبلغ بيوصل خلال ٢٤ ساعة عمل على المحفظة المرتبطة بحسابك.', darkGreen: darkGreen, onTap: (i) => setState(() => _expandedIndex = i)),
      SizedBox(height: AppSpacing.md.ah),
      FaqItem(index: 1, expandedIndex: _expandedIndex, title: 'كيفية تحديث رخصة القيادة؟', content: 'يمكنك تحديث رخصة القيادة من خلال مركز الوثائق في الملف الشخصي.', darkGreen: darkGreen, onTap: (i) => setState(() => _expandedIndex = i)),
      SizedBox(height: AppSpacing.md.ah),
      FaqItem(index: 2, expandedIndex: _expandedIndex, title: 'ماذا أفعل في حالة عطل السيارة؟', content: 'يرجى التواصل مع الدعم الفني المباشر فوراً وإلغاء الرحلة إذا كان هناك راكب.', darkGreen: darkGreen, onTap: (i) => setState(() => _expandedIndex = i)),
    ]);
  }
}











