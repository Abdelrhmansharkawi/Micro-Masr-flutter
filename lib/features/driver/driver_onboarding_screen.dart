import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/app_route_constant.dart';
import 'package:micromasr/core/app_button.dart';
import 'package:micromasr/features/driver/onboarding_illustrations.dart';
import 'package:micromasr/features/driver/onboarding_slide.dart';

class DriverOnboardingScreen extends StatefulWidget {
  const DriverOnboardingScreen({super.key});

  @override
  State<DriverOnboardingScreen> createState() => _DriverOnboardingScreenState();
}

class _DriverOnboardingScreenState extends State<DriverOnboardingScreen> {
  late final PageController _pageController;
  int _currentPage = 0;

  static const _slides = [
    _SlideData(
      title: AppStrings.driverOnboarding1Title,
      body: AppStrings.driverOnboarding1Body,
      illustration: DriverHomeIllustration(),
    ),
    _SlideData(
      title: AppStrings.driverOnboarding2Title,
      body: AppStrings.driverOnboarding2Body,
      illustration: TripRequestIllustration(),
    ),
    _SlideData(
      title: AppStrings.driverOnboarding3Title,
      body: AppStrings.driverOnboarding3Body,
      illustration: EarningsIllustration(),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNext() {
    if (_currentPage < _slides.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    } else {
      _finish();
    }
  }

  void _finish() {
    context.go(AppRouteConstants.driverRegisterPersonal);
  }

  @override
  Widget build(BuildContext context) {
    final isLast = _currentPage == _slides.length - 1;

    return Scaffold(
      backgroundColor: context.colors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Skip bar
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.md.aw,
                vertical: AppSpacing.sm.ah,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (!isLast)
                    TextButton(
                      onPressed: _finish,
                      child: Text(
                        AppStrings.skip,
                        style: context.bodyMediumTextStyle.copyWith(
                          color: context.colors.textSecondary,
                        ),
                      ),
                    )
                  else
                    const SizedBox.shrink(),
                  Text(
                    '${_currentPage + 1} // ${_slides.length}',
                    style: context.bodySmallTextStyle.copyWith(
                      color: context.colors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),

            // PageView
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _slides.length,
                onPageChanged: (index) => setState(() => _currentPage = index),
                itemBuilder: (context, index) {
                  final slide = _slides[index];
                  return OnboardingSlide(
                    title: slide.title,
                    body: slide.body,
                    illustration: slide.illustration,
                  );
                },
              ),
            ),

            // Dots
            OnboardingDots(
              count: _slides.length,
              activeIndex: _currentPage,
            ),
            SizedBox(height: AppSpacing.lg.ah),

            // Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.aw),
              child: AppButton(
                label: isLast ? AppStrings.startNow : AppStrings.next,
                onPressed: _onNext,
                type: AppButtonType.primary,
              ),
            ),
            SizedBox(height: AppSpacing.xl.ah),
          ],
        ),
      ),
    );
  }
}

class _SlideData {
  const _SlideData({
    required this.title,
    required this.body,
    required this.illustration,
  });

  final String title;
  final String body;
  final Widget illustration;
}












