import 'package:flutter/material.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/app_button.dart';
import 'package:micromasr/core/app_text_field.dart';

class RegisterVehicleScreen extends StatelessWidget {
  const RegisterVehicleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: AppBar(
        backgroundColor: context.colors.surface,
        elevation: 0,
        title: Text(
          AppStrings.vehicleInfo,
          style: context.headlineMediumTextStyle.copyWith(
            color: context.colors.onSurface,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppSpacing.md.aw),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        AppStrings.vehicleInfo,
                        style: context.headlineMediumTextStyle.copyWith(
                          color: context.colors.onBackground,
                        ),
                      ),
                      SizedBox(height: AppSpacing.lg.ah),
                      AppTextField(
                        label: AppStrings.vehicleType,
                        prefixIcon: Icon(
                          Icons.directions_car_outlined,
                          color: context.colors.textSecondary,
                        ),
                      ),
                      SizedBox(height: AppSpacing.md.ah),
                      AppTextField(
                        label: AppStrings.licensePlate,
                        prefixIcon: Icon(
                          Icons.pin_outlined,
                          color: context.colors.textSecondary,
                        ),
                      ),
                      SizedBox(height: AppSpacing.md.ah),
                      AppTextField(
                        label: AppStrings.capacity,
                        keyboardType: TextInputType.number,
                        prefixIcon: Icon(
                          Icons.group_outlined,
                          color: context.colors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AppButton(
                label: AppStrings.next,
                onPressed: () {},
                type: AppButtonType.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}











