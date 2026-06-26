import 'package:flutter/material.dart';
import 'package:micromasr/core/app_radius.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.label,
    this.hintText,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.onChanged,
    this.readOnly = false,
    this.onTap,
    this.maxLines = 1,
    this.initialValue,
  });

  final String? label;
  final String? hintText;
  final String? initialValue;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool readOnly;
  final VoidCallback? onTap;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: controller == null ? initialValue : null,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      onChanged: onChanged,
      readOnly: readOnly,
      onTap: onTap,
      maxLines: maxLines,
      style: context.bodyLargeTextStyle.copyWith(
        color: context.colors.onSurface,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: context.bodyMediumTextStyle.copyWith(
          color: context.colors.textSecondary,
        ),
        hintText: hintText,
        hintStyle: context.bodyMediumTextStyle.copyWith(
          color: context.colors.textSecondary,
        ),
        floatingLabelStyle: context.bodyMediumTextStyle.copyWith(
          color: context.colors.primary,
        ),
        filled: true,
        fillColor: context.colors.surface,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppSpacing.md.aw,
          vertical: AppSpacing.md.ah,
        ),
        border: _buildBorder(context.colors.outline),
        enabledBorder: _buildBorder(context.colors.outline),
        focusedBorder: _buildBorder(context.colors.primary, width: 2),
        errorBorder: _buildBorder(context.colors.error),
        focusedErrorBorder: _buildBorder(context.colors.error, width: 2),
      ),
    );
  }

  OutlineInputBorder _buildBorder(Color color, {double width = 1.0}) {
    return OutlineInputBorder(
      borderRadius: AppRadius.smAll,
      borderSide: BorderSide(color: color, width: width.aw),
    );
  }
}











