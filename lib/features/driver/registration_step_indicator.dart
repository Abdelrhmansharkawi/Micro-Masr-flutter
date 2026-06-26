import 'package:flutter/material.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/features/driver/step_indicator_widgets.dart';

class RegistrationStepIndicator extends StatelessWidget {
  const RegistrationStepIndicator({super.key, required this.currentStep});
  final int currentStep;
  static const _labels = [AppStrings.stepBasicInfo, AppStrings.stepDocuments];

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      StepCircle(index: 0, currentStep: currentStep, label: _labels[0]),
      Expanded(child: StepLine(isCompleted: currentStep > 0)),
      StepCircle(index: 1, currentStep: currentStep, label: _labels[1]),
    ]);
  }
}











