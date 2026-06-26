import 'package:flutter/material.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/app_button.dart';
import 'package:micromasr/core/app_text_field.dart';
import 'package:micromasr/features/driver/star_rating_bar.dart';
import 'package:micromasr/core/app_strings.dart';

class DriverRatingModal extends StatefulWidget {
  final String tripId, passengerId, passengerName;
  const DriverRatingModal({
    super.key,
    required this.tripId,
    required this.passengerId,
    required this.passengerName,
  });

  static Future<void> show(
    BuildContext context, {
    required String tripId,
    required String passengerId,
    required String passengerName,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: false,
      enableDrag: false,
      builder: (_) => DriverRatingModal(
        tripId: tripId,
        passengerId: passengerId,
        passengerName: passengerName,
      ),
    );
  }

  @override
  State<DriverRatingModal> createState() => _DriverRatingModalState();
}

class _DriverRatingModalState extends State<DriverRatingModal> {
  int _selectedRating = 0;
  final _feedbackController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    setState(() => _isLoading = true);
    
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    
    if (mounted) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(AppStrings.thanksForUsing), 
          backgroundColor: context.colors.primary,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + AppSpacing.xl.ah,
        top: AppSpacing.xl.ah,
        left: AppSpacing.xl.aw,
        right: AppSpacing.xl.aw,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const _Handle(),
          _SkipBtn(onTap: () => Navigator.pop(context)),
          Text(
            'قيّم الراكب ${widget.passengerName}',
            style: context.titleLargeTextStyle.copyWith(
              color: context.colors.onSurface,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppSpacing.xxl.ah),
          StarRatingBar(
            selectedRating: _selectedRating,
            isSubmitting: _isLoading,
            onRatingChanged: (i) => setState(() => _selectedRating = i),
          ),
          SizedBox(height: AppSpacing.xl.ah),
          AppTextField(
            controller: _feedbackController,
            hintText: 'إضافة تعليق (اختياري)',
            maxLines: 3,
            readOnly: _isLoading,
          ),
          SizedBox(height: AppSpacing.xxl.ah),
          AppButton(
            label: _isLoading ? 'جاري الإرسال...' : AppStrings.submitRating,
            onPressed: _selectedRating > 0 && !_isLoading ? _submit : () {},
            type: _selectedRating > 0 ? AppButtonType.primary : AppButtonType.secondary,
          ),
        ],
      ),
    );
  }
}

class _Handle extends StatelessWidget {
  const _Handle();
  @override
  Widget build(BuildContext context) => Center(
    child: Container(
      width: 48.aw,
      height: 4.ah,
      decoration: BoxDecoration(
        color: context.colors.outline,
        borderRadius: BorderRadius.circular(2),
      ),
    ),
  );
}

class _SkipBtn extends StatelessWidget {
  final VoidCallback onTap;
  const _SkipBtn({required this.onTap});
  @override
  Widget build(BuildContext context) => Align(
    alignment: Alignment.centerLeft,
    child: TextButton(
      onPressed: onTap,
      child: Text(
        'تخطي',
        style: context.bodyLargeTextStyle.copyWith(color: context.colors.primary),
      ),
    ),
  );
}
