import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/app_route_constant.dart';
import 'package:micromasr/core/app_button.dart';
import 'package:micromasr/core/app_text_field.dart';
import 'package:micromasr/features/driver/google_sign_in_button.dart';
import 'package:micromasr/features/driver/registration_form_fields.dart';
import 'package:micromasr/features/driver/registration_header.dart';
import 'package:micromasr/features/driver/registration_step_indicator.dart';

import 'package:micromasr/features/driver/registration_app_bar.dart';

class RegisterPersonalScreen extends StatefulWidget {
  const RegisterPersonalScreen({super.key});
  @override
  State<RegisterPersonalScreen> createState() => _RegisterPersonalScreenState();
}

class _RegisterPersonalScreenState extends State<RegisterPersonalScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _plateController = TextEditingController();

  bool _obscurePassword = true, _obscureConfirm = true;
  String? _selectedVehicleType;
  static const _vehicleTypes = ['ميكروباص', 'تاكسي', 'أتوبيس صغير'];

  @override
  void dispose() {
    for (var c in [_fullNameController, _phoneController, _emailController, _passwordController, _confirmPasswordController, _plateController]) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: const RegistrationAppBar(title: AppStrings.driverRegisterTitle),
      body: SafeArea(
        top: false,
        child: Form(
          key: _formKey,
          child: Column(children: [
            Expanded(child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.aw, vertical: AppSpacing.md.ah),
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                const RegistrationHeader(title: AppStrings.driverRegistrationTitle, subtitle: AppStrings.driverRegistrationSubtitle),
                SizedBox(height: AppSpacing.lg.ah),
                const RegistrationStepIndicator(currentStep: 0),
                SizedBox(height: AppSpacing.lg.ah),
                _buildFormCard(),
                SizedBox(height: AppSpacing.lg.ah),
                const OrDivider(),
                SizedBox(height: AppSpacing.md.ah),
                GoogleSignInButton(onTap: () {}),
              ]),
            )),
            Padding(padding: EdgeInsets.fromLTRB(AppSpacing.lg.aw, AppSpacing.sm.ah, AppSpacing.lg.aw, AppSpacing.lg.ah), child: AppButton(label: AppStrings.continueToDocuments, onPressed: _submit, type: AppButtonType.primary)),
          ]),
        ),
      ),
    );
  }

  Widget _buildFormCard() {
    return Container(
      decoration: BoxDecoration(color: context.colors.surface, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 12, offset: const Offset(0, 4))]),
      padding: EdgeInsets.all(AppSpacing.md.aw),
      child: Column(children: [
        AppTextField(controller: _fullNameController, label: AppStrings.fullName, prefixIcon: const FieldIcon(Icons.person_outline_rounded), validator: _req),
        SizedBox(height: AppSpacing.md.ah),
        PhoneField(controller: _phoneController),
        SizedBox(height: AppSpacing.md.ah),
        AppTextField(controller: _emailController, label: AppStrings.email, keyboardType: TextInputType.emailAddress, prefixIcon: const FieldIcon(Icons.mail_outline_rounded)),
        SizedBox(height: AppSpacing.md.ah),
        AppTextField(controller: _passwordController, label: AppStrings.password, obscureText: _obscurePassword, prefixIcon: const FieldIcon(Icons.lock_outline_rounded), suffixIcon: PasswordToggle(isObscure: _obscurePassword, onToggle: () => setState(() => _obscurePassword = !_obscurePassword)), validator: _req),
        SizedBox(height: AppSpacing.md.ah),
        AppTextField(controller: _confirmPasswordController, label: AppStrings.confirmPassword, obscureText: _obscureConfirm, prefixIcon: const FieldIcon(Icons.refresh_rounded), suffixIcon: PasswordToggle(isObscure: _obscureConfirm, onToggle: () => setState(() => _obscureConfirm = !_obscureConfirm)), validator: (v) => v != _passwordController.text ? 'غير متطابق' : null),
        SizedBox(height: AppSpacing.md.ah),
        Row(children: [
          Expanded(child: VehicleTypeDropdown(value: _selectedVehicleType, items: _vehicleTypes, onChanged: (v) => setState(() => _selectedVehicleType = v))),
          SizedBox(width: AppSpacing.sm.aw),
          Expanded(child: AppTextField(controller: _plateController, label: AppStrings.vehiclePlate, prefixIcon: const FieldIcon(Icons.credit_card_rounded), validator: _req)),
        ]),
      ]),
    );
  }

  void _submit() { if (_formKey.currentState?.validate() ?? false) context.push(AppRouteConstants.driverRegisterDocuments); }
  String? _req(String? v) => (v == null || v.isEmpty) ? 'مطلوب' : null;
}











