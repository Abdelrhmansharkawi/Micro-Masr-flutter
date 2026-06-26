import 'package:flutter/material.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';

class DriverVehicleDetailsScreen extends StatelessWidget {
  const DriverVehicleDetailsScreen({super.key});

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
                    'تفاصيل المركبة',
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

              // Image Card
              Container(
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
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        height: 180.ah,
                        width: double.infinity,
                        color: Colors.grey[200], // Placeholder
                        child: const Icon(Icons.directions_car, size: 64, color: Colors.grey),
                      ),
                    ),
                    SizedBox(height: AppSpacing.md.ah),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.aw, vertical: 8.ah),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: Colors.lightGreen.withValues(alpha: 0.3)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.edit_outlined, color: Colors.lightGreen, size: 16.aw),
                          SizedBox(width: 8.aw),
                          Text(
                            'تعديل صورة المركبة',
                            style: context.bodyMediumTextStyle.copyWith(
                              color: Colors.lightGreen,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSpacing.lg.ah),

              // Basic Info Card
              Container(
                padding: EdgeInsets.all(AppSpacing.lg.aw),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'معلومات المركبة الأساسية',
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

                    _buildInfoRow(context, 'نوع المركبة', 'تويوتا ميكروباص', darkGreen),
                    SizedBox(height: AppSpacing.md.ah),
                    _buildInfoRow(context, 'رقم اللوحة', 'أ ب ج ١٢٣٤', const Color(0xFFE28B5A)),
                    SizedBox(height: AppSpacing.md.ah),
                    _buildInfoRow(context, 'سنة الموديل', '٢٠٢٢', darkGreen),
                    SizedBox(height: AppSpacing.md.ah),
                    _buildInfoRow(context, 'عدد الركاب المسموح', '١٤ راْب', darkGreen),
                  ],
                ),
              ),
              SizedBox(height: AppSpacing.lg.ah),

              // Ownership Status
              Container(
                padding: EdgeInsets.all(AppSpacing.lg.aw),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.aw, vertical: 6.ah),
                      decoration: BoxDecoration(
                        color: Colors.lightGreen.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.check_circle, color: Colors.lightGreen, size: 16.aw),
                          SizedBox(width: 6.aw),
                          Text(
                            'مركبة مملوكة',
                            style: context.bodyMediumTextStyle.copyWith(
                              color: Colors.lightGreen,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'حالة الملكية',
                      style: context.bodyLargeTextStyle.copyWith(
                        color: darkGreen,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSpacing.xxl.ah),

              // Update Button
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16.ah),
                decoration: BoxDecoration(
                  color: darkGreen,
                  borderRadius: BorderRadius.circular(24),
                ),
                alignment: Alignment.center,
                child: Text(
                  'تحديث البيانات',
                  style: context.titleMediumTextStyle.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: AppSpacing.xl.ah),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value, Color valueColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          value,
          style: context.bodyLargeTextStyle.copyWith(
            color: valueColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: context.bodyMediumTextStyle.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
      ],
    );
  }
}











