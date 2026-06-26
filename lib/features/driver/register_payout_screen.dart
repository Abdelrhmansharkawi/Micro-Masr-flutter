import 'package:flutter/material.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/app_button.dart';
import 'package:micromasr/core/app_text_field.dart';

class RegisterPayoutScreen extends StatelessWidget {
  const RegisterPayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: AppBar(
        backgroundColor: context.colors.surface,
        elevation: 0,
        title: Text(
          AppStrings.payoutInfo,
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
              Text(
                AppStrings.payoutInfo,
                style: context.headlineMediumTextStyle.copyWith(
                  color: context.colors.onBackground,
                ),
              ),
              SizedBox(height: AppSpacing.lg.ah),
              AppTextField(
                label: AppStrings.bankAccount,
                keyboardType: TextInputType.number,
                prefixIcon: Icon(
                  Icons.account_balance_outlined,
                  color: context.colors.textSecondary,
                ),
              ),
              const Spacer(),
              AppButton(
                label: AppStrings.submit,
                onPressed: () {},
                type: AppButtonType.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}











