import 'package:flutter/material.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/app_card.dart';
import 'package:micromasr/core/vertical_space.dart';

import 'package:micromasr/features/passenger/profile_app_bar.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String selectedLanguage = 'ar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2EFE8),
      appBar: const ProfileAppBar(title: 'اللغة'),
      body: Padding(
        padding: EdgeInsets.all(20.aw),
        child: Column(
          children: [
            _buildLanguageItem(context, 'العربية', 'ar', isSelected: selectedLanguage == 'ar'),
            const VerticalSpace(16),
            _buildLanguageItem(context, 'English', 'en', isSelected: selectedLanguage == 'en'),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageItem(BuildContext context, String label, String code, {required bool isSelected}) {
    return GestureDetector(
      onTap: () => setState(() => selectedLanguage = code),
      child: AppCard(
        padding: EdgeInsets.symmetric(horizontal: 16.aw, vertical: 16.ah),
        child: Row(
          children: [
            if (isSelected)
              Icon(Icons.check_circle, color: context.colors.primary, size: 24.aw)
            else
              Container(
                width: 24.aw,
                height: 24.aw,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: context.colors.outline.withValues(alpha: 0.3), width: 2),
                ),
              ),
            const Spacer(),
            Text(
              label,
              style: context.titleMediumTextStyle.copyWith(
                color: context.colors.primary,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}











