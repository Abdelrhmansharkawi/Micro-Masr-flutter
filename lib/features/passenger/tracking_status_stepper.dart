import 'package:flutter/material.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/vertical_space.dart';

class TrackingStatusStepper extends StatelessWidget {
  final String currentStep; // 'onWay','arrived','inTrip','reached'
  const TrackingStatusStepper({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    const steps = [
      {'label': AppStrings.statusOnWay, 'key': 'onWay'},
      {'label': AppStrings.statusArrived, 'key': 'arrived'},
      {'label': AppStrings.statusInTrip, 'key': 'inTrip'},
      {'label': AppStrings.statusReached, 'key': 'reached'},
    ];

    final activeStepIdx = steps.indexWhere(
      (s) => s['key'] == currentStep,
    );

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withValues(alpha: 0.05), blurRadius: 10)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(steps.length * 2 - 1, (index) {
          if (index.isOdd) {
            final i = index ~/ 2; 
            final isLineActive = i < activeStepIdx;
            return _buildLine(isLineActive, context);
          }
          final stepIndex = index ~/ 2;
          final step = steps[stepIndex];
          final isActive = step['key'] == currentStep;
          return _buildStep(context, step['label'] as String, isActive);
        }),
      ),
    );
  }

  Widget _buildStep(BuildContext context, String label, bool isActive) {
    return Column(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive
                ? const Color(0xFF558B2F)
                : context.colors.outline.withValues(alpha: 0.2),
            border: isActive ? null : Border.all(color: context.colors.outline),
          ),
          child: isActive
              ? const Icon(Icons.check, size: 16, color: Colors.white)
              : null,
        ),
        const VerticalSpace(8),
        Text(label,
            style: context.labelSmallTextStyle.copyWith(
                color: isActive
                    ? const Color(0xFF558B2F)
                    : context.colors.textSecondary,
                fontWeight: isActive ? FontWeight.bold : null)),
      ],
    );
  }

  Widget _buildLine(bool isActive, BuildContext context) {
    return Expanded(
      child: Container(
        height: 2,
        color: isActive
            ? const Color(0xFF558B2F)
            : context.colors.outline.withValues(alpha: 0.2),
        margin: const EdgeInsets.only(bottom: 24),
      ),
    );
  }
}
