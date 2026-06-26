import 'package:flutter/material.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';

class RegistrationHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const RegistrationHeader({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: context.headlineLargeTextStyle.copyWith(
            color: context.colors.onBackground,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: AppSpacing.xs.ah),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: context.bodyMediumTextStyle.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
      ],
    );
  }
}











