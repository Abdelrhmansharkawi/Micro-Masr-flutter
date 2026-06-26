import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/horizontal_space.dart';

class RidesHeader extends StatelessWidget {
  const RidesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const HorizontalSpace(40),
        Text(
          AppStrings.availableRidesTitle,
          style: context.headlineLargeTextStyle.copyWith(
            color: context.colors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
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
      ],
    );
  }
}











