import 'package:flutter/material.dart';
import 'package:micromasr/core/app_radius.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/app_button.dart';
import 'package:micromasr/core/vertical_space.dart';

enum DialogType { success, error, warning, info }

class AppDialog extends StatelessWidget {
  const AppDialog({
    super.key,
    required this.title,
    required this.message,
    this.type = DialogType.info,
    this.onConfirm,
    this.confirmLabel,
  });

  final String title;
  final String message;
  final DialogType type;
  final VoidCallback? onConfirm;
  final String? confirmLabel;

  static Future<void> show(
    BuildContext context, {
    required String title,
    required String message,
    DialogType type = DialogType.info,
    VoidCallback? onConfirm,
    String? confirmLabel,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AppDialog(
        title: title,
        message: message,
        type: type,
        onConfirm: onConfirm,
        confirmLabel: confirmLabel,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg)),
      backgroundColor: context.colors.surface,
      child: _AppDialogBody(
        title: title,
        message: message,
        type: type,
        onConfirm: onConfirm,
        confirmLabel: confirmLabel,
      ),
    );
  }
}

class _AppDialogBody extends StatelessWidget {
  const _AppDialogBody({
    required this.title,
    required this.message,
    required this.type,
    this.onConfirm,
    this.confirmLabel,
  });

  final String title;
  final String message;
  final DialogType type;
  final VoidCallback? onConfirm;
  final String? confirmLabel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildIcon(context),
          const VerticalSpace(16),
          Text(title,
              style: context.headlineMediumTextStyle.copyWith(
                  fontWeight: FontWeight.bold, color: context.colors.onSurface),
              textAlign: TextAlign.center),
          const VerticalSpace(8),
          Text(message,
              style: context.bodyLargeTextStyle
                  .copyWith(color: context.colors.textSecondary),
              textAlign: TextAlign.center),
          const VerticalSpace(24),
          AppButton(
            label: confirmLabel ?? 'حسناً',
            onPressed: () {
              Navigator.of(context).pop();
              onConfirm?.call();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(BuildContext context) {
    final (icon, color) = switch (type) {
      DialogType.success => (
          Icons.check_circle_outline,
          const Color(0xFF4CAF50)
        ),
      DialogType.error => (Icons.error_outline, context.colors.error),
      DialogType.warning => (
          Icons.warning_amber_outlined,
          const Color(0xFFFFC107)
        ),
      DialogType.info => (Icons.info_outline, context.colors.primary),
    };
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1), shape: BoxShape.circle),
      child: Icon(icon, color: color, size: 48),
    );
  }
}
