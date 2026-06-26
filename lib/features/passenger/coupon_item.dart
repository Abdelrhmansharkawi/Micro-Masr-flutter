import 'package:flutter/material.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/app_card.dart';

class CouponItem extends StatelessWidget {
  final String title;
  final String discount;
  final String expiry;
  final VoidCallback onActivate;

  const CouponItem({
    super.key,
    required this.title,
    required this.discount,
    required this.expiry,
    required this.onActivate,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      margin: EdgeInsets.only(bottom: 16.ah),
      padding: EdgeInsets.zero,
      child: IntrinsicHeight(
        child: Row(
          children: [
            // Left side (Action)
            InkWell(
              onTap: onActivate,
              child: Container(
                width: 80.aw,
                decoration: BoxDecoration(
                  color: context.colors.primary,
                  borderRadius: const BorderRadiusDirectional.only(
                    topStart: Radius.circular(20),
                    bottomStart: Radius.circular(20),
                  ),
                ),
                child: Center(
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      'تفعيل',
                      style: context.titleSmallTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            // Right side (Details)
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.aw),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.aw, vertical: 4.ah),
                      decoration: BoxDecoration(
                        color: Colors.lightGreen.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        discount,
                        style: context.bodySmallTextStyle.copyWith(color: Colors.lightGreen, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      title,
                      style: context.titleMediumTextStyle.copyWith(fontWeight: FontWeight.bold, color: context.colors.primary),
                    ),
                    Text(
                      'ينتهي في $expiry',
                      style: context.bodySmallTextStyle.copyWith(color: context.colors.textSecondary),
                    ),
                  ],
                ),
              ),
            ),
            // Icon
            Padding(
              padding: EdgeInsets.all(16.aw),
              child: Icon(Icons.confirmation_number_rounded, color: context.colors.primary, size: 32.aw),
            ),
          ],
        ),
      ),
    );
  }
}











