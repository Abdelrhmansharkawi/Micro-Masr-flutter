import 'package:flutter/material.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';

class DriverDocumentCenterScreen extends StatelessWidget {
  const DriverDocumentCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bgColor = const Color(0xFFF2EFE8);
    final darkGreen = const Color(0xFF4A7450);

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.aw, vertical: AppSpacing.md.ah),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 24),
                  Text(
                    'مركز الوثائق',
                    style: context.titleLargeTextStyle.copyWith(
                      color: darkGreen,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_forward_rounded, color: darkGreen),
                  ),
                ],
              ),
              SizedBox(height: AppSpacing.xl.ah),

              // Status Banner
              Container(
                padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.aw, vertical: AppSpacing.md.ah),
                decoration: BoxDecoration(
                  color: Colors.lightGreen.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.lightGreen.withValues(alpha: 0.3)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'كل وثائقك سارية ومكتملة',
                      style: context.bodyMediumTextStyle.copyWith(
                        color: darkGreen,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8.aw),
                    Icon(Icons.check_circle, color: Colors.lightGreen, size: 20.aw),
                  ],
                ),
              ),
              SizedBox(height: AppSpacing.xl.ah),

              // Document Cards
              _buildDocCard(
                context,
                title: 'رخصة القيادة الشخصية',
                subtitle: 'تنتهي خلال ٨ أشهر',
                icon: Icons.badge_outlined,
                actionText: 'عرض/تحديث',
                isOutline: true,
                darkGreen: darkGreen,
              ),
              SizedBox(height: AppSpacing.md.ah),
              _buildDocCard(
                context,
                title: 'رخصة تسيير المركبة',
                subtitle: 'سارية',
                subtitleIcon: Icons.check,
                icon: Icons.directions_car_outlined,
                actionText: 'عرض/تحديث',
                isOutline: true,
                darkGreen: darkGreen,
              ),
              SizedBox(height: AppSpacing.md.ah),
              _buildDocCard(
                context,
                title: 'صحيفة الحالة الجنائية',
                subtitle: 'تحتاج تحديث خلال شهر',
                subtitleColor: const Color(0xFFE28B5A),
                icon: Icons.shield_outlined,
                actionText: 'رفع جديد',
                isOutline: false,
                darkGreen: darkGreen,
              ),
              SizedBox(height: AppSpacing.xxl.ah),

              // Quick Preview
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'معاينة سريعة لآخر وثيقة',
                    style: context.titleMediumTextStyle.copyWith(
                      color: darkGreen,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8.aw),
                  Container(
                    width: 4.aw,
                    height: 20.ah,
                    decoration: BoxDecoration(
                      color: Colors.lightGreen,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSpacing.lg.ah),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _buildPreviewThumb(),
                  SizedBox(width: 12.aw),
                  _buildPreviewThumb(),
                  SizedBox(width: 12.aw),
                  _buildPreviewThumb(),
                ],
              ),
              SizedBox(height: AppSpacing.xxl.ah),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDocCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    Color? subtitleColor,
    IconData? subtitleIcon,
    required IconData icon,
    required String actionText,
    required bool isOutline,
    required Color darkGreen,
  }) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.md.aw),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Action Button
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.aw, vertical: 8.ah),
            decoration: BoxDecoration(
              color: isOutline ? Colors.transparent : darkGreen,
              border: isOutline ? Border.all(color: Colors.lightGreen.withValues(alpha: 0.3)) : null,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Text(
              actionText,
              style: context.bodySmallTextStyle.copyWith(
                color: isOutline ? Colors.lightGreen : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(),
          // Info
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                title,
                style: context.bodyLargeTextStyle.copyWith(
                  color: darkGreen,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    subtitle,
                    style: context.bodySmallTextStyle.copyWith(
                      color: subtitleColor ?? Colors.lightGreen,
                    ),
                  ),
                  if (subtitleIcon != null) ...[
                    SizedBox(width: 4.aw),
                    Icon(subtitleIcon, color: Colors.lightGreen, size: 12.aw),
                  ]
                ],
              ),
            ],
          ),
          SizedBox(width: AppSpacing.md.aw),
          // Icon
          Icon(icon, color: darkGreen, size: 28.aw),
        ],
      ),
    );
  }

  Widget _buildPreviewThumb() {
    return Container(
      width: 80.aw,
      height: 80.aw,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFF1E3C40), // Dark background matching the image
      ),
      child: Center(
        child: Icon(Icons.description, color: Colors.white70, size: 40.aw),
      ),
    );
  }
}











