import 'package:flutter/material.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';

class DriverPersonalInfoScreen extends StatelessWidget {
  const DriverPersonalInfoScreen({super.key});

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
                  const SizedBox(width: 24), // Placeholder for balance
                  Text(
                    'المعلومات الشخصية',
                    style: context.titleLargeTextStyle.copyWith(
                      color: darkGreen,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: EdgeInsets.all(8.aw),
                      decoration: BoxDecoration(
                        color: darkGreen.withValues(alpha: 0.05),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.arrow_forward_rounded, color: darkGreen),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSpacing.xl.ah),

              // Avatar
              Center(
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Container(
                      width: 100.aw,
                      height: 100.aw,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: darkGreen,
                        border: Border.all(color: Colors.white, width: 4),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(6.aw),
                      decoration: const BoxDecoration(
                        color: Color(0xFF4A7450),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.camera_alt_outlined, color: Colors.white, size: 16.aw),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSpacing.xl.ah),

              // Form
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
                    _buildLabel(context, 'الاسم الكامل', darkGreen),
                    _buildTextField(context, 'أحمد محمد محمود', Icons.person_outline),
                    SizedBox(height: AppSpacing.md.ah),

                    _buildLabel(context, 'رقم الموبايل', darkGreen),
                    _buildTextField(
                      context,
                      '+20 122 333 4444',
                      Icons.phone_outlined,
                      prefixWidget: Icon(Icons.verified, color: Colors.lightGreen, size: 20.aw),
                    ),
                    SizedBox(height: AppSpacing.md.ah),

                    _buildLabel(context, 'البريد الإلكتروني', darkGreen),
                    _buildTextField(context, 'ahmed.m@email.com', Icons.email_outlined),
                  ],
                ),
              ),
              SizedBox(height: AppSpacing.lg.ah),

              // Change Password
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
                          'تغيير كلمة السر',
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

                    _buildLabel(context, 'كلمة السر الحالية', darkGreen),
                    _buildTextField(
                      context,
                      '********',
                      Icons.lock_outline,
                      prefixWidget: Icon(Icons.visibility_off_outlined, color: context.colors.textSecondary, size: 20.aw),
                    ),
                    SizedBox(height: AppSpacing.md.ah),

                    _buildLabel(context, 'كلمة السر الجديدة', darkGreen),
                    _buildTextField(
                      context,
                      'أدخل كلمة السر الجديدة',
                      Icons.lock_reset_outlined,
                      prefixWidget: Icon(Icons.visibility_outlined, color: context.colors.textSecondary, size: 20.aw),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSpacing.xxl.ah),

              // Save Button
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16.ah),
                decoration: BoxDecoration(
                  color: darkGreen,
                  borderRadius: BorderRadius.circular(24),
                ),
                alignment: Alignment.center,
                child: Text(
                  'حفظ التغييرات',
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

  Widget _buildLabel(BuildContext context, String text, Color darkGreen) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.ah, right: 4.aw),
      child: Text(
        text,
        style: context.bodySmallTextStyle.copyWith(
          color: darkGreen,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildTextField(BuildContext context, String hint, IconData icon, {Widget? prefixWidget}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF2EFE8),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.md.aw, vertical: 4.ah),
      child: Row(
        children: [
          if (prefixWidget != null) prefixWidget,
          Expanded(
            child: TextField(
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                hintStyle: context.bodyMediumTextStyle.copyWith(
                  color: context.colors.textSecondary,
                ),
              ),
            ),
          ),
          SizedBox(width: AppSpacing.sm.aw),
          Icon(icon, color: const Color(0xFF4A7450), size: 20.aw),
        ],
      ),
    );
  }
}











