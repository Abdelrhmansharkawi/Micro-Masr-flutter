import 'package:flutter/material.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';

class StepCircle extends StatelessWidget {
  final int index, currentStep;
  final String label;
  const StepCircle({super.key, required this.index, required this.currentStep, required this.label});

  @override
  Widget build(BuildContext context) {
    final bool isDone = index < currentStep, isActive = index == currentStep;
    final Color bg = isDone || isActive ? context.colors.primary : context.colors.surface;
    final Color border = isDone || isActive ? context.colors.primary : context.colors.outline;
    final Color textColor = isDone || isActive ? context.colors.onPrimary : context.colors.textSecondary;

    return Column(children: [
      AnimatedContainer(
        duration: const Duration(milliseconds: 300), width: 36.aw, height: 36.aw,
        decoration: BoxDecoration(color: bg, shape: BoxShape.circle, border: Border.all(color: border, width: 1.5.aw)),
        child: Center(child: isDone ? Icon(Icons.check_rounded, color: context.colors.onPrimary, size: 18.aw) : Text('${index + 1}', style: context.bodyMediumTextStyle.copyWith(color: textColor, fontWeight: FontWeight.w700))),
      ),
      SizedBox(height: AppSpacing.xs.ah),
      Text(label, style: context.labelSmallTextStyle.copyWith(color: isActive ? context.colors.onBackground : context.colors.textSecondary, fontWeight: isActive ? FontWeight.w600 : FontWeight.w400)),
    ]);
  }
}

class StepLine extends StatelessWidget {
  final bool isCompleted;
  const StepLine({super.key, required this.isCompleted});
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(bottom: 20.ah), child: AnimatedContainer(duration: const Duration(milliseconds: 300), height: 2.ah, color: isCompleted ? context.colors.primary : context.colors.outline));
  }
}











