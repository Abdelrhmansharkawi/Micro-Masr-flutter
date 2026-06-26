import 'package:flutter/material.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/app_button.dart';

class RatingSuccessState extends StatelessWidget {
  const RatingSuccessState({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Icon(Icons.check_circle_outline, size: 100.aw, color: context.colors.success),
      SizedBox(height: AppSpacing.xl.ah),
      AppButton(label: AppStrings.close, onPressed: () => Navigator.pop(context)),
    ]);
  }
}

class RatingFormContent extends StatelessWidget {
  final int rating;
  final TextEditingController controller;
  final VoidCallback onSubmit, onSkip;
  final Function(int) onRatingChanged;

  const RatingFormContent({super.key, required this.rating, required this.controller, required this.onSubmit, required this.onSkip, required this.onRatingChanged});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(Icons.directions_car_outlined, size: 80.aw, color: context.colors.primary),
      SizedBox(height: AppSpacing.lg.ah),
      Text(AppStrings.rateYourTrip, style: context.headlineMediumTextStyle.copyWith(color: context.colors.onSurface), textAlign: TextAlign.center),
      SizedBox(height: AppSpacing.xl.ah),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: List.generate(5, (i) => IconButton(icon: Icon(i < rating ? Icons.star : Icons.star_border, size: 40.aw, color: context.colors.warning), onPressed: () => onRatingChanged(i + 1)))),
      SizedBox(height: AppSpacing.lg.ah),
      TextField(controller: controller, maxLines: 4, decoration: _inputDeco(context)),
      const Spacer(),
      AppButton(label: AppStrings.submitRating, onPressed: rating > 0 ? onSubmit : () {}, type: AppButtonType.primary),
      SizedBox(height: AppSpacing.sm.ah),
      AppButton.text(label: AppStrings.skipRating, onPressed: onSkip),
    ]);
  }

  InputDecoration _inputDeco(BuildContext context) => InputDecoration(hintText: AppStrings.addComment, hintStyle: context.bodyMediumTextStyle.copyWith(color: context.colors.textSecondary), filled: true, fillColor: context.colors.surface, border: _border(context.colors.outline), enabledBorder: _border(context.colors.outline), focusedBorder: _border(context.colors.primary));
  OutlineInputBorder _border(Color c) => OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: c));
}











