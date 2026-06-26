import 'package:flutter/material.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:go_router/go_router.dart';
import 'package:micromasr/core/app_route_constant.dart';
import 'package:micromasr/core/app_card.dart';
import 'package:micromasr/core/vertical_space.dart';
import 'package:micromasr/core/app_button.dart';
import 'package:micromasr/core/app_text_field.dart';
import 'package:micromasr/features/passenger/profile_app_bar.dart';

class ReportProblemScreen extends StatefulWidget {
  const ReportProblemScreen({super.key});

  @override
  State<ReportProblemScreen> createState() => _ReportProblemScreenState();
}

class _ReportProblemScreenState extends State<ReportProblemScreen> {
  String? selectedProblemType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2EFE8),
      appBar: const ProfileAppBar(title: 'إبلاغ عن مشكلة'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.aw),
        child: Column(
          children: [
            // Problem Type Dropdown
            _buildDropdown(context),
            const VerticalSpace(24),
            
            // Description Field
            const AppTextField(
              label: 'تفاصيل المشكلة',
              hintText: 'اشرح المشكلة بالتفصيل لمساعدتنا في حلها...',
              maxLines: 5,
            ),
            const VerticalSpace(24),
            
            // Upload Image Section
            _buildImageUpload(context),
            const VerticalSpace(40),
            
            AppButton(
              label: 'إرسال البلاغ',
              onPressed: () => context.go(AppRouteConstants.passengerProfile),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.symmetric(horizontal: 16.aw),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedProblemType,
          hint: Text(
            'اختر نوع المشكلة',
            style: context.bodySmallTextStyle.copyWith(color: context.colors.textSecondary),
          ),
          isExpanded: true,
          icon: Icon(Icons.keyboard_arrow_down_rounded, color: context.colors.primary),
          items: ['تطبيق الهاتف', 'السائق', 'الرحلة', 'الدفع'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: context.bodyMediumTextStyle),
            );
          }).toList(),
          onChanged: (val) => setState(() => selectedProblemType = val),
        ),
      ),
    );
  }

  Widget _buildImageUpload(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.all(20.aw),
      child: Column(
        children: [
          Icon(Icons.cloud_upload_outlined, size: 48.aw, color: context.colors.primary.withValues(alpha: 0.5)),
          const VerticalSpace(12),
          Text(
            'إرفاق صورة (اختياري)',
            style: context.bodyMediumTextStyle.copyWith(color: context.colors.textSecondary),
          ),
          const VerticalSpace(8),
          Text(
            'يمكنك تحميل صور بحد أقصى ٥ ميجابايت',
            style: context.bodySmallTextStyle.copyWith(color: context.colors.textSecondary.withValues(alpha: 0.5)),
          ),
        ],
      ),
    );
  }
}











