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
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          AppStrings.availableRidesTitle,
          style: context.headlineLargeTextStyle.copyWith(
            color: context.colors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}











