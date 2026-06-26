import 'package:flutter/material.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';

// Preferred route dropdown with a label header.
// Displays available bus routes for the driver to choose from.
class PreferredRouteSelector extends StatelessWidget {
  const PreferredRouteSelector({
    super.key,
    required this.selectedRoute,
    required this.onChanged,
  });

  final String? selectedRoute;
  final ValueChanged<String?> onChanged;

  static const _routes = [
    'المنطقة الصناعية — محطة مصر',
    'الجامعة — محطة مصر',
    'الحي العاشر — وسط البلد',
    'مدينة نصر — مصر الجديدة',
    'العباسية — التحرير',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Label
        Text(
          AppStrings.preferredRoute,
          textAlign: TextAlign.right,
          style: context.titleMediumTextStyle.copyWith(
            color: context.colors.onBackground,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: AppSpacing.sm.ah),

        // Dropdown
        DropdownButtonFormField<String>(
          initialValue: selectedRoute,
          hint: Row(
            children: [
              Icon(Icons.route_outlined,
                  color: context.colors.textSecondary, size: 20.aw),
              SizedBox(width: AppSpacing.sm.aw),
              Text(
                AppStrings.chooseRoute,
                style: context.bodyMediumTextStyle.copyWith(
                  color: context.colors.textSecondary,
                ),
              ),
            ],
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: context.colors.surface,
            contentPadding: EdgeInsets.symmetric(
              horizontal: AppSpacing.md.aw,
              vertical: AppSpacing.md.ah,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: context.colors.outline),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: context.colors.outline),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: context.colors.primary, width: 2),
            ),
          ),
          isExpanded: true,
          items: _routes
              .map((r) => DropdownMenuItem(
                    value: r,
                    child: Text(
                      r,
                      textAlign: TextAlign.right,
                      style: context.bodyMediumTextStyle,
                    ),
                  ))
              .toList(),
          onChanged: onChanged,
          icon: Icon(Icons.keyboard_arrow_down_rounded,
              color: context.colors.textSecondary),
        ),
      ],
    );
  }
}











