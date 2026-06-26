import 'package:flutter/material.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/app_card.dart';
import 'package:micromasr/core/app_empty_state.dart';

class EarningsScreen extends StatelessWidget {
  const EarningsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: AppBar(
        backgroundColor: context.colors.surface,
        elevation: 0,
        title: Text(
          AppStrings.earnings,
          style: context.headlineMediumTextStyle.copyWith(
            color: context.colors.onSurface,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppSpacing.md.aw),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: AppCard(
                      child: Column(
                        children: [
                          Text(
                            AppStrings.todayEarnings,
                            style: context.titleMediumTextStyle.copyWith(
                              color: context.colors.textSecondary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: AppSpacing.sm.ah),
                          Text(
                            '0',
                            style: context.headlineLargeTextStyle.copyWith(
                              color: context.colors.primary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: AppSpacing.md.aw),
                  Expanded(
                    child: AppCard(
                      child: Column(
                        children: [
                          Text(
                            AppStrings.weeklyEarnings,
                            style: context.titleMediumTextStyle.copyWith(
                              color: context.colors.textSecondary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: AppSpacing.sm.ah),
                          Text(
                            '0',
                            style: context.headlineLargeTextStyle.copyWith(
                              color: context.colors.primary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Expanded(
                child: AppEmptyState(
                  icon: Icons.receipt_long_outlined,
                  title: AppStrings.noEarningsToday,
                  message: '',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}











