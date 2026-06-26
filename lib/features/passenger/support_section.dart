import 'package:flutter/material.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/app_route_constant.dart';
import 'package:go_router/go_router.dart';
import './profile_section.dart';
import './profile_menu_item.dart';

class SupportSection extends StatelessWidget {
  const SupportSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileSection(
      title: 'الدعم والمساعدة',
      children: [
        ProfileMenuItem(
          icon: Icons.help_outline_rounded,
          label: AppStrings.helpCenter,
          onTap: () => context.push(AppRouteConstants.helpCenter),
        ),
        ProfileMenuItem(
          icon: Icons.flag_outlined,
          label: AppStrings.reportProblem,
          onTap: () => context.push(AppRouteConstants.reportProblem),
        ),
        ProfileMenuItem(
          icon: Icons.phone_in_talk_outlined,
          label: AppStrings.contactUs,
          onTap: () => context.push(AppRouteConstants.contactUs),
          showDivider: false,
        ),
      ],
    );
  }
}











