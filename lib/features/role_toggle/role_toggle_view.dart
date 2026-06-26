import 'package:flutter/material.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/features/role_toggle/role_card.dart';

class RoleToggleView extends StatelessWidget {
  const RoleToggleView({
    required this.onPassengerSelected,
    required this.onDriverSelected,
    required this.isLoading,
    super.key,
  });

  final VoidCallback onPassengerSelected;
  final VoidCallback onDriverSelected;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.aw, vertical: 24.ah),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 32.ah),

                // App Title
                Text(
                  'Micro Masr',
                  style: context.headlineLargeTextStyle.copyWith(
                    color: context.colors.primary,
                  ),
                ),

                SizedBox(height: 8.ah),

                // Subtitle
                Text(
                  AppStrings.selectRoleTitle,
                  style: context.bodyLargeTextStyle.copyWith(
                    color: context.colors.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 48.ah),

                // Passenger Role Card
                RoleCard(
                  iconAsset: 'assets/icons/passenger_icon.svg',
                  title: AppStrings.passengerRole,
                  subtitle: AppStrings.passengerRoleSubtitle,
                  buttonLabel: AppStrings.passengerRoleButton,
                  buttonColor: context.colors.primary,
                  onPressed: isLoading ? () {} : onPassengerSelected,
                ),

                SizedBox(height: 20.ah),

                // Driver Role Card
                RoleCard(
                  iconAsset: 'assets/icons/driver_icon.svg',
                  title: AppStrings.driverRole,
                  subtitle: AppStrings.driverRoleSubtitle,
                  buttonLabel: AppStrings.driverRoleButton,
                  buttonColor: context.colors.warning,
                  onPressed: isLoading ? () {} : onDriverSelected,
                ),

                SizedBox(height: 32.ah),
              ],
            ),
          ),
        ),
      ),
    );
  }
}











