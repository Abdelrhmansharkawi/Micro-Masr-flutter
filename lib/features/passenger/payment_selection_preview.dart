import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/app_route_constant.dart';
import 'package:micromasr/core/horizontal_space.dart';
import 'package:micromasr/core/vertical_space.dart';

class PaymentSelectionPreview extends StatelessWidget {
  const PaymentSelectionPreview({super.key});

  @override
  Widget build(BuildContext context) {
    const String methodName = AppStrings.creditCard;
    const IconData methodIcon = Icons.credit_card;
    const Color iconColor = Colors.blue;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.paymentMethodLabel, 
          style: context.titleMediumTextStyle.copyWith(fontWeight: FontWeight.bold),
        ),
        const VerticalSpace(12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: context.colors.background, 
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.1), 
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(methodIcon, color: iconColor, size: 20),
              ),
              const HorizontalSpace(12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    methodName, 
                    style: context.titleMediumTextStyle.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '**** 20 19', 
                    style: context.bodySmallTextStyle.copyWith(color: context.colors.textSecondary),
                  ),
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => context.push(AppRouteConstants.passengerPayment),
                child: Text(
                  AppStrings.change, 
                  style: context.bodyMediumTextStyle.copyWith(
                    color: const Color(0xFFF09063), 
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}












