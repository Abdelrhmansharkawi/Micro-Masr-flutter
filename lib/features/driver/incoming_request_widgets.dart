import 'package:flutter/material.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/app_card.dart';

class RequestTimer extends StatelessWidget {
  const RequestTimer({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(child: SizedBox(width: 80.aw, height: 80.aw, child: Stack(fit: StackFit.expand, children: [CircularProgressIndicator(value: 0.7, strokeWidth: 6.aw, color: context.colors.primary, backgroundColor: context.colors.primaryContainer), Center(child: Icon(Icons.timer_outlined, color: context.colors.primary, size: 32.aw))])));
  }
}

class RequestFareCard extends StatelessWidget {
  const RequestFareCard({super.key});
  @override
  Widget build(BuildContext context) {
    return AppCard(child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(AppStrings.fare, style: context.bodyLargeTextStyle.copyWith(color: context.colors.textSecondary)), Text(AppStrings.cash, style: context.titleLargeTextStyle.copyWith(color: context.colors.primary))]));
  }
}

class RequestHandle extends StatelessWidget {
  const RequestHandle({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(child: Container(width: 48.aw, height: 4.ah, decoration: BoxDecoration(color: context.colors.outline, borderRadius: BorderRadius.circular(2))));
  }
}











