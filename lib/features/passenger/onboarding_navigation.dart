import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/app_route_constant.dart';
import 'package:micromasr/core/app_button.dart';

class OnboardingNavigation extends StatelessWidget {
  const OnboardingNavigation({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onNext,
  });

  final int currentPage;
  final int totalPages;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.aw, vertical: 32.ah),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (currentPage < totalPages - 1)
            TextButton(
              onPressed: () => context.go(AppRouteConstants.passengerLogin),
              child: Text(
                AppStrings.skip,
                style: context.bodyLargeTextStyle.copyWith(
                  color: context.colors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          else
            const SizedBox.shrink(),
          SizedBox(
            width: 140.aw,
            child: AppButton(
              label: currentPage == totalPages - 1 ? AppStrings.getStarted : AppStrings.next,
              onPressed: onNext,
            ),
          ),
        ],
      ),
    );
  }
}











