import 'package:flutter/material.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/app_button.dart';

class RegistrationDocumentsFooter extends StatelessWidget {
  const RegistrationDocumentsFooter({super.key, required this.onSubmit});
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(AppSpacing.lg.aw, AppSpacing.sm.ah, AppSpacing.lg.aw, AppSpacing.md.ah),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppButton(label: AppStrings.sendForReview, onPressed: onSubmit, type: AppButtonType.primary),
          SizedBox(height: AppSpacing.sm.ah),
          Text(AppStrings.reviewDisclaimer, textAlign: TextAlign.center, style: context.bodySmallTextStyle.copyWith(color: context.colors.textSecondary, height: 1.5)),
        ],
      ),
    );
  }
}











