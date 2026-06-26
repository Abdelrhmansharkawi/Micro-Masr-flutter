import 'package:flutter/material.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/app_text_field.dart';

class FieldIcon extends StatelessWidget {
  const FieldIcon(this.icon, {super.key});
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(icon, color: context.colors.textSecondary, size: 20.aw);
  }
}

class PasswordToggle extends StatelessWidget {
  const PasswordToggle({super.key, required this.isObscure, required this.onToggle});
  final bool isObscure;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isObscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
        color: context.colors.textSecondary, size: 20.aw,
      ),
      onPressed: onToggle,
    );
  }
}

class PhoneField extends StatelessWidget {
  const PhoneField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 56.ah, padding: EdgeInsets.symmetric(horizontal: 12.aw),
          decoration: BoxDecoration(color: context.colors.surface, borderRadius: BorderRadius.circular(8), border: Border.all(color: context.colors.outline)),
          child: Center(child: Text('+20', style: context.bodyLargeTextStyle.copyWith(color: context.colors.onSurface, fontWeight: FontWeight.w600))),
        ),
        SizedBox(width: AppSpacing.sm.aw),
        Expanded(child: AppTextField(
          controller: controller, label: AppStrings.phoneNumber, keyboardType: TextInputType.phone,
          prefixIcon: Icon(Icons.phone_outlined, color: context.colors.textSecondary, size: 20.aw),
          validator: (v) => (v == null || v.isEmpty) ? 'مطلوب' : null,
        )),
      ],
    );
  }
}

class VehicleTypeDropdown extends StatelessWidget {
  const VehicleTypeDropdown({super.key, required this.value, required this.items, required this.onChanged});
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      initialValue: value,
      hint: Text(AppStrings.vehicleType, style: context.bodyMediumTextStyle.copyWith(color: context.colors.textSecondary)),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.directions_car_outlined, color: context.colors.textSecondary, size: 20.aw),
        filled: true, fillColor: context.colors.surface,
        contentPadding: EdgeInsets.symmetric(horizontal: AppSpacing.md.aw, vertical: AppSpacing.md.ah),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: context.colors.outline)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: context.colors.outline)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: context.colors.primary, width: 2)),
      ),
      items: items.map((t) => DropdownMenuItem(value: t, child: Text(t))).toList(),
      onChanged: onChanged,
      validator: (v) => v == null ? 'مطلوب' : null,
    );
  }
}











