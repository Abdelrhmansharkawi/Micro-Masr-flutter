import 'package:flutter/material.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';

class DriverWithdrawalHistoryScreen extends StatelessWidget {
  const DriverWithdrawalHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bgColor = const Color(0xFFF2EFE8);
    final darkGreen = const Color(0xFF4A7450);
    final orangeColor = const Color(0xFFE28B5A);

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.aw, vertical: AppSpacing.md.ah),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 20.aw,
                    backgroundColor: Colors.lightGreen,
                    child: const Icon(Icons.person, color: Colors.white),
                  ),
                  Text(
                    'سجل السحوبات',
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
            ),
            SizedBox(height: AppSpacing.md.ah),

            // List of withdrawals
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.aw),
                itemCount: 5,
                separatorBuilder: (context, index) => SizedBox(height: AppSpacing.md.ah),
                itemBuilder: (context, index) {
                  // Mock data
                  final isPending = index == 0;
                  final statusText = isPending ? 'قيد المعالجة' : 'مكتمل';
                  final statusColor = isPending ? orangeColor : Colors.lightGreen;
                  final amount = index == 1 ? '١٢٠٠ ج' : '٤٥٠ ج';
                  final date = index == 0 ? 'اليوم، ١٠:٣٠ ص' : '١٥ أبريل، ٢:١٥ م';
                  final method = index % 2 == 0 ? 'فودافون كاش' : 'حساب بنكي';

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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Left side (Amount and Status)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              amount,
                              style: context.titleMediumTextStyle.copyWith(
                                color: darkGreen,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4.ah),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8.aw, vertical: 2.ah),
                              decoration: BoxDecoration(
                                color: statusColor.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                statusText,
                                style: context.bodySmallTextStyle.copyWith(
                                  color: statusColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Right side (Method and Date)
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  method,
                                  style: context.bodyMediumTextStyle.copyWith(
                                    color: darkGreen,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Text(
                                  date,
                                  style: context.bodySmallTextStyle.copyWith(
                                    color: context.colors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: AppSpacing.md.aw),
                            Container(
                              padding: EdgeInsets.all(8.aw),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF2EFE8),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                index % 2 == 0 ? Icons.sim_card : Icons.account_balance_rounded,
                                color: darkGreen,
                                size: 24.aw,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}











