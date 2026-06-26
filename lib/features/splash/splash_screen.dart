import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:micromasr/core/app_route_constant.dart';
import 'package:micromasr/features/splash/splash_view.dart';
import 'package:micromasr/core/services/auth_state_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _determineStartRoute();
  }

  Future<void> _determineStartRoute() async {
    await Future.delayed(const Duration(seconds: 4));

    final isLoggedIn = await AuthStateService.isLoggedIn();

    if (mounted) {
      if (isLoggedIn) {
        context.go(AppRouteConstants.passengerHome);
      } else {
        context.go(AppRouteConstants.toggle);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const SplashView();
  }
}
