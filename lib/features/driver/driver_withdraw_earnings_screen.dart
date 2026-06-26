import 'package:flutter/material.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';

class DriverWithdrawEarningsScreen extends StatefulWidget {
  const DriverWithdrawEarningsScreen({super.key});

  @override
  State<DriverWithdrawEarningsScreen> createState() => _DriverWithdrawEarningsScreenState();
}

class _DriverWithdrawEarningsScreenState extends State<DriverWithdrawEarningsScreen> {
  int _selectedMethod = 0; // 0: Vodafone Cash, 1: Bank, 2: Wallet
  bool _isSuccess = false;

  @override
  Widget build(BuildContext context) {
    final bgColor = const Color(0xFFF2EFE8);
    final darkGreen = const Color(0xFF4A7450);
    final orangeColor = const Color(0xFFE28B5A);

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
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back_rounded, color: darkGreen), // usually back is left, but image shows arrow pointing right on the right side. Wait, if it's RTL, arrow_forward on the right is back. Let's use arrow_forward if RTL, or just pop icon. We will use arrow_forward to match image.
                  ),
                  Text(
                    'سحب الأرباح',
                    style: context.titleLargeTextStyle.copyWith(
                      color: darkGreen,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  CircleAvatar(
                    radius: 20.aw,
                    backgroundColor: Colors.lightGreen,
                    child: const Icon(Icons.person, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: AppSpacing.xl.ah),

              // Available Balance Card
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
                          'الرصيد المتاح',
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
                    SizedBox(height: AppSpacing.md.ah),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 6.ah, right: 8.aw),
                          child: Text(
                            'جم',
                            style: context.titleMediumTextStyle.copyWith(
                              color: darkGreen,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          '1,450.50',
                          style: context.headlineLargeTextStyle.copyWith(
                            color: darkGreen,
                            fontWeight: FontWeight.w900,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                    // Small wallet icon on top left
                    Align(
                      alignment: Alignment.topLeft,
                      child: Icon(Icons.account_balance_wallet_outlined, color: Colors.lightGreen),
                    )
                  ],
                ),
              ),
              SizedBox(height: AppSpacing.xl.ah),

              // Enter Amount
              _buildSectionHeader(context, 'أدخل المبلغ', darkGreen),
              SizedBox(height: AppSpacing.sm.ah),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.symmetric(horizontal: AppSpacing.md.aw),
                child: TextField(
                  textAlign: TextAlign.right,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '0.00',
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(top: 14.ah),
                      child: Text('جم', style: context.bodyMediumTextStyle.copyWith(color: context.colors.textSecondary)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppSpacing.xl.ah),

              // Choose Withdrawal Method
              _buildSectionHeader(context, 'اختر وسيلة السحب', darkGreen),
              SizedBox(height: AppSpacing.sm.ah),
              _buildMethodCard(
                context: context,
                index: 0,
                title: 'فودافون كاش',
                subtitle: '010 **** 5678',
                icon: Icons.sim_card, // Placeholder for Vodafone icon
                darkGreen: darkGreen,
              ),
              SizedBox(height: AppSpacing.sm.ah),
              _buildMethodCard(
                context: context,
                index: 1,
                title: 'حساب بنكي',
                subtitle: 'البنك الأهلي المصري',
                icon: Icons.account_balance_rounded,
                darkGreen: darkGreen,
              ),
              SizedBox(height: AppSpacing.sm.ah),
              _buildMethodCard(
                context: context,
                index: 2,
                title: 'محفظة إلكترونية',
                subtitle: 'أضف محفظة جديدة',
                icon: Icons.account_balance_wallet_rounded,
                darkGreen: darkGreen,
              ),
              SizedBox(height: AppSpacing.xl.ah),

              // Note
              Container(
                padding: EdgeInsets.all(AppSpacing.md.aw),
                decoration: BoxDecoration(
                  color: darkGreen.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.lightGreen.withValues(alpha: 0.3),
                    style: BorderStyle.solid,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'ملاحظة',
                          style: context.bodyMediumTextStyle.copyWith(
                            color: darkGreen,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 8.aw),
                        Icon(Icons.info_outline_rounded, color: Colors.lightGreen, size: 20.aw),
                      ],
                    ),
                    SizedBox(height: 8.ah),
                    Text(
                      'تتم معالجة طلبات السحب خلال 24 ساعة عمل. قد يتم تطبيق رسوم بسيطة حسب وسيلة السحب المختارة.',
                      textAlign: TextAlign.right,
                      style: context.bodySmallTextStyle.copyWith(
                        color: context.colors.textSecondary,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSpacing.xl.ah),

              // Confirm Button
              GestureDetector(
                onTap: () {
                  setState(() => _isSuccess = true);
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 16.ah),
                  decoration: BoxDecoration(
                    color: orangeColor,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.keyboard_double_arrow_left_rounded, color: Colors.white),
                      SizedBox(width: 8.aw),
                      Text(
                        'تأكيد السحب',
                        style: context.titleMediumTextStyle.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: AppSpacing.lg.ah),

              // Success Message (Mock)
              if (_isSuccess)
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16.ah),
                  decoration: BoxDecoration(
                    color: Colors.lightGreen.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.lightGreen.withValues(alpha: 0.3)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'تم طلب السحب بنجاح',
                            style: context.bodyLargeTextStyle.copyWith(
                              color: darkGreen,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'رقم العملية: #MS-99421',
                            style: context.bodySmallTextStyle.copyWith(
                              color: context.colors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 16.aw),
                      Container(
                        padding: EdgeInsets.all(6.aw),
                        decoration: BoxDecoration(
                          color: Colors.lightGreen,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.check, color: Colors.white, size: 20.aw),
                      ),
                    ],
                  ),
                ),
                
              SizedBox(height: AppSpacing.xxl.ah),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title, Color darkGreen) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          title,
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
    );
  }

  Widget _buildMethodCard({
    required BuildContext context,
    required int index,
    required String title,
    required String subtitle,
    required IconData icon,
    required Color darkGreen,
  }) {
    final isSelected = _selectedMethod == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedMethod = index),
      child: Container(
        padding: EdgeInsets.all(AppSpacing.md.aw),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isSelected ? Colors.lightGreen : Colors.transparent,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.02),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Radio button
            Container(
              width: 24.aw,
              height: 24.aw,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? Colors.lightGreen : context.colors.outline.withValues(alpha: 0.3),
                  width: 2,
                ),
                color: isSelected ? Colors.lightGreen : Colors.transparent,
              ),
            ),
            const Spacer(),
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
                Text(
                  subtitle,
                  style: context.bodySmallTextStyle.copyWith(
                    color: context.colors.textSecondary,
                  ),
                ),
              ],
            ),
            SizedBox(width: AppSpacing.md.aw),
            Container(
              padding: EdgeInsets.all(10.aw),
              decoration: BoxDecoration(
                color: const Color(0xFFF2EFE8),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: darkGreen, size: 24.aw),
            ),
          ],
        ),
      ),
    );
  }
}











