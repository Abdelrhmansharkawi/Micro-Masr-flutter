import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:micromasr/core/app_route_constant.dart';
import 'package:micromasr/features/role_toggle/role_toggle_view.dart';

class RoleToggleScreen extends StatelessWidget {
  const RoleToggleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RoleToggleView(
      isLoading: false,
      onPassengerSelected: () {
        context.go(AppRouteConstants.passengarOnboarding);
      },
      onDriverSelected: () {
        context.go(AppRouteConstants.driverOnboarding);
      },
    );
  }
}












