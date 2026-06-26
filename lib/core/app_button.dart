import 'package:flutter/material.dart';
import 'package:micromasr/core/app_radius.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';

enum AppButtonType { primary, secondary, text }

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.type = AppButtonType.primary,
    this.isLoading = false,
    this.isDisabled = false,
    this.icon,
  });

  const AppButton.primary({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.icon,
  }) : type = AppButtonType.primary;

  const AppButton.secondary({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.icon,
  }) : type = AppButtonType.secondary;

  const AppButton.text({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.icon,
  }) : type = AppButtonType.text;

  final String label;
  final VoidCallback onPressed;
  final AppButtonType type;
  final bool isLoading;
  final bool isDisabled;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final active = !isDisabled && !isLoading;
    final primary = context.colors.primary;
    final onPrimary = context.colors.onPrimary;
    final disabledColor = primary.withValues(alpha: 0.5);

    return SizedBox(
      width: double.infinity,
      height: 48.ah,
      child: switch (type) {
        AppButtonType.primary => ElevatedButton(
            onPressed: active ? onPressed : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: active ? primary : disabledColor,
              foregroundColor: onPrimary,
              disabledBackgroundColor: disabledColor,
              shape: RoundedRectangleBorder(borderRadius: AppRadius.pillAll),
              elevation: 0,
            ),
            child: _buildChild(context, onPrimary),
          ),
        AppButtonType.secondary => OutlinedButton(
            onPressed: active ? onPressed : null,
            style: OutlinedButton.styleFrom(
              foregroundColor: active ? primary : disabledColor,
              side: BorderSide(color: active ? primary : disabledColor, width: 1.aw),
              shape: RoundedRectangleBorder(borderRadius: AppRadius.pillAll),
            ),
            child: _buildChild(context, active ? primary : disabledColor),
          ),
        AppButtonType.text => TextButton(
            onPressed: active ? onPressed : null,
            style: TextButton.styleFrom(foregroundColor: active ? primary : disabledColor),
            child: _buildChild(context, active ? primary : disabledColor),
          ),
      },
    );
  }

  Widget _buildChild(BuildContext context, Color color) {
    if (isLoading) {
      return SizedBox(
        width: 24.aw,
        height: 24.aw,
        child: CircularProgressIndicator(
          strokeWidth: 2.aw,
          valueColor: AlwaysStoppedAnimation<Color>(color),
        ),
      );
    }
    
    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 20.aw),
          SizedBox(width: 8.aw),
          Text(label, style: context.labelLargeTextStyle.copyWith(color: color)),
        ],
      );
    }
    
    return Text(label, style: context.labelLargeTextStyle.copyWith(color: color));
  }
}











