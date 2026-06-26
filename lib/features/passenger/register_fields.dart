import 'package:flutter/material.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/app_text_field.dart';
import 'package:micromasr/core/validation_utils.dart';
import 'package:micromasr/core/vertical_space.dart';
import 'package:micromasr/core/horizontal_space.dart';

class RegisterFields extends StatefulWidget {
  const RegisterFields({
    super.key,
    required this.nameController,
    required this.phoneController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  State<RegisterFields> createState() => _RegisterFieldsState();
}

class _RegisterFieldsState extends State<RegisterFields> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextField(
          label: AppStrings.fullName,
          controller: widget.nameController,
          prefixIcon: Icon(Icons.person_outline, color: context.colors.textSecondary),
          hintText: 'محمد أحمد',
          validator: ValidationUtils.validateRequired,
        ),
        const VerticalSpace(16),
        _buildPhoneField(context),
        const VerticalSpace(16),
        AppTextField(
          label: AppStrings.emailOptional,
          controller: widget.emailController,
          keyboardType: TextInputType.emailAddress,
          prefixIcon: Icon(Icons.email_outlined, color: context.colors.textSecondary),
          hintText: 'name@example.com',
          validator: ValidationUtils.validateEmail,
        ),
        const VerticalSpace(16),
        _buildPasswordField(context),
        const VerticalSpace(16),
        AppTextField(
          label: AppStrings.confirmPassword,
          controller: widget.confirmPasswordController,
          obscureText: true,
          prefixIcon: Icon(Icons.lock_outline, color: context.colors.textSecondary),
          validator: (value) => ValidationUtils.validateConfirmPassword(value, widget.passwordController.text),
        ),
      ],
    );
  }

  Widget _buildPhoneField(BuildContext context) {
    return AppTextField(
      label: AppStrings.phoneNumber,
      controller: widget.phoneController,
      keyboardType: TextInputType.phone,
      prefixIcon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const HorizontalSpace(12),
          Text(
            '+20',
            style: context.bodyLargeTextStyle.copyWith(
              fontWeight: FontWeight.bold,
              color: context.colors.onSurface,
            ),
          ),
          const HorizontalSpace(8),
          Container(width: 1, height: 24.ah, color: context.colors.outline),
          const HorizontalSpace(8),
          Icon(Icons.phone_outlined, color: context.colors.textSecondary),
        ],
      ),
      hintText: '100 123 4567',
      validator: ValidationUtils.validatePhone,
    );
  }

  Widget _buildPasswordField(BuildContext context) {
    return AppTextField(
      label: AppStrings.password,
      controller: widget.passwordController,
      obscureText: _obscurePassword,
      prefixIcon: Icon(Icons.lock_outline, color: context.colors.textSecondary),
      validator: ValidationUtils.validatePassword,
      suffixIcon: IconButton(
        icon: Icon(
          _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          color: context.colors.textSecondary,
        ),
        onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
      ),
    );
  }
}











