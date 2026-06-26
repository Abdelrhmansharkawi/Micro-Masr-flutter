import 'package:flutter/material.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/app_route_constant.dart';
import 'package:go_router/go_router.dart';
import './profile_section.dart';
import './profile_menu_item.dart';

class AccountSection extends StatelessWidget {
  const AccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileSection(
      title: 'حسابي',
      children: [
        ProfileMenuItem(
          icon: Icons.person_outline_rounded,
          label: AppStrings.personalInfo,
          onTap: () => context.push(AppRouteConstants.personalInfo),
        ),
        ProfileMenuItem(
          icon: Icons.location_on_outlined,
          label: AppStrings.savedPlaces,
          onTap: () => context.push(AppRouteConstants.savedPlaces),
        ),
        ProfileMenuItem(
          icon: Icons.payment_rounded,
          label: AppStrings.paymentMethods,
          onTap: () => context.push(AppRouteConstants.paymentMethods),
        ),
        ProfileMenuItem(
          icon: Icons.confirmation_number_outlined,
          label: AppStrings.coupons,
          onTap: () => context.push(AppRouteConstants.coupons),
          showDivider: false,
        ),
      ],
    );
  }
}











