import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      body: SafeArea(
        child: Center(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),

                // Central Logo with smooth fade-in animation
                SvgPicture.asset(
                  'assets/images/splash_logo.svg',
                  width: 150.aw,
                  height: 150.aw,
                  colorFilter: ColorFilter.mode(
                    context.colors.onPrimary,
                    BlendMode.srcIn,
                  ),
                ),

                SizedBox(height: 24.ah),
                const Spacer(),

                // Footer text: "With pride from Egypt" (Figma: displayLarge style)
                Text(
                  'بكل فخر من مصر',
                  style: context.displayLargeTextStyle.copyWith(
                    color: context.colors.onPrimary,
                  ),
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










