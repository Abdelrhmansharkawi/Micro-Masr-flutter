import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/app_route_constant.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(AppRouteConstants.passengerSearch),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.aw, vertical: 12.ah),
        decoration: BoxDecoration(
          color: context.colors.surface,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(Icons.mic_none, color: context.colors.primary, size: 24.aw),
            const Spacer(),
            Text(
              AppStrings.whereToToday,
              style: context.bodyLargeTextStyle.copyWith(color: context.colors.textSecondary),
            ),
            const Spacer(),
            Icon(Icons.search, color: context.colors.textSecondary, size: 24.aw),
          ],
        ),
      ),
    );
  }
}











