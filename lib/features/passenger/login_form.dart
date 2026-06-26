import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/app_route_constant.dart';
import 'package:micromasr/core/app_button.dart';
import 'package:micromasr/core/app_text_field.dart';
import 'package:micromasr/core/validation_utils.dart';
import 'package:micromasr/core/vertical_space.dart';
import 'package:micromasr/features/passenger/data/services/auth_service.dart';
import 'package:micromasr/core/services/storage_service.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _identifierController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _identifierController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      try {
        final authService = AuthService();

        final data = await authService.login(
          email: _identifierController.text.trim(),
          password: _passwordController.text.trim(),
        );

        final token = data['token'];
        final refreshToken = data['refreshToken'];

        await StorageService.saveToken(token);
        if (refreshToken != null) {
  await StorageService.saveRefreshToken(refreshToken);
}

        final user = data['data']?['user'];

        if (user != null) {
          await StorageService.saveUserId(
            user['_id'].toString(),
          );
        }

        if (mounted) {
          context.go(AppRouteConstants.passengerHome);
        }
      } catch (e) {
        if (mounted) {
          _showErrorSnackBar(e.toString());
        }
      } finally {
        if (mounted) {
          setState(() => _isLoading = false);
        }
      }
    }
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.redAccent),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextField(
            label: AppStrings.loginIdentifier,
            controller: _identifierController,
            prefixIcon:
                Icon(Icons.person_outline, color: context.colors.textSecondary),
            validator: (value) => ValidationUtils.validateRequired(value),
          ),
          const VerticalSpace(16),
          AppTextField(
            label: AppStrings.password,
            controller: _passwordController,
            obscureText: _obscurePassword,
            prefixIcon:
                Icon(Icons.lock_outline, color: context.colors.textSecondary),
            suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: context.colors.textSecondary,
              ),
              onPressed: () =>
                  setState(() => _obscurePassword = !_obscurePassword),
            ),
            validator: ValidationUtils.validatePassword,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              onPressed: () {},
              child: Text(
                AppStrings.forgotPassword,
                style: context.bodyMediumTextStyle.copyWith(
                  color: const Color(0xFFF09063),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const VerticalSpace(24),
          AppButton(
            label: AppStrings.signIn,
            isLoading: _isLoading,
            onPressed: _handleLogin,
          ),
        ],
      ),
    );
  }
}
