import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';

class SeatsHeader extends StatelessWidget {
  const SeatsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => context.pop(),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: context.colors.surface,
              shape: BoxShape.circle,
              border: Border.all(color: context.colors.outline.withValues(alpha: 0.3)),
            ),
            child: Icon(Icons.arrow_forward, color: context.colors.primary, size: 24.aw),
          ),
        ),
        const Spacer(),
        Text(
          AppStrings.selectSeatTitle,
          style: context.headlineLargeTextStyle.copyWith(
            color: context.colors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 40),
      ],
    );
  }
}











