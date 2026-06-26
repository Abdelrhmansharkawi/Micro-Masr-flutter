import 'package:flutter/material.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/features/driver/driver_shared_widgets.dart';

class BalanceCard extends StatelessWidget {
  final dynamic earnings;
  final Color darkGreen;
  final Color orangeColor;
  const BalanceCard({super.key, required this.earnings, required this.darkGreen, required this.orangeColor});

  @override
  Widget build(BuildContext context) {
    return DriverCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'رصيد المتاح', 
            style: context.bodyMediumTextStyle.copyWith(color: darkGreen, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: AppSpacing.sm.ah),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 6.ah, right: 8.aw),
                child: Text(
                  'جنيه', 
                  style: context.titleMediumTextStyle.copyWith(color: darkGreen, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                earnings.todayEarnings.toInt().toString(), 
                style: context.headlineLargeTextStyle.copyWith(color: orangeColor, fontWeight: FontWeight.w900, height: 1),
              ),
            ],
          ),
          SizedBox(height: 4.ah),
          Text(
            'آخر تحديث: منذ دقيقتين', 
            style: context.bodySmallTextStyle.copyWith(color: context.colors.textSecondary, fontSize: 10),
          ),
          SizedBox(height: AppSpacing.xl.ah),
          Row(
            children: [
              Expanded(
                child: _ActionBtn(
                  title: 'سجل\nالسحوبات', 
                  icon: Icons.history_rounded, 
                  isPrimary: false, 
                  darkGreen: darkGreen, 
                  orangeColor: orangeColor, 
                  onTap: () {},
                ),
              ),
              SizedBox(width: AppSpacing.md.aw),
              Expanded(
                child: _ActionBtn(
                  title: 'سحب\nالأرباح', 
                  icon: Icons.account_balance_wallet_outlined, 
                  isPrimary: true, 
                  darkGreen: darkGreen, 
                  orangeColor: orangeColor, 
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ActionBtn extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isPrimary;
  final Color darkGreen, orangeColor;
  final VoidCallback onTap;

  const _ActionBtn({
    required this.title, 
    required this.icon, 
    required this.isPrimary, 
    required this.darkGreen, 
    required this.orangeColor, 
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.ah),
        decoration: BoxDecoration(
          color: isPrimary ? orangeColor : Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: isPrimary ? null : Border.all(color: Colors.lightGreen.withValues(alpha: 0.5)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title, 
              textAlign: TextAlign.center, 
              style: context.bodyMediumTextStyle.copyWith(
                color: isPrimary ? Colors.white : Colors.lightGreen, 
                fontWeight: FontWeight.bold, 
                height: 1.2,
              ),
            ),
            SizedBox(width: AppSpacing.sm.aw),
            Icon(icon, color: isPrimary ? Colors.white : Colors.lightGreen),
          ],
        ),
      ),
    );
  }
}












