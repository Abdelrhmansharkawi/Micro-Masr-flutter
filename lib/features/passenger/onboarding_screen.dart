import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/app_route_constant.dart';
import 'package:micromasr/core/app_page_indicator.dart';
import 'package:micromasr/core/vertical_space.dart';
import 'onboarding_navigation.dart';
import 'onboarding_page_view.dart';

class OnboardingData {
  final String title;
  final String subtitle;
  final String image;

  OnboardingData({
    required this.title,
    required this.subtitle,
    required this.image,
  });

  static List<OnboardingData> get passengerPages => [
    OnboardingData(
      title: 'مرحباً بك في ميكرو مصر',
      subtitle: 'أسهل طريقة للتنقل في مصر بالميكروباص',
      image: 'assets/images/onboarding_1.svg',
    ),
    OnboardingData(
      title: 'احجز مقعدك',
      subtitle: 'اختر رحلتك واحجز مقعدك مسبقاً بكل سهولة',
      image: 'assets/images/onboarding_2.svg',
    ),
    OnboardingData(
      title: 'تتبع رحلتك',
      subtitle: 'تابع موقع الميكروباص لحظة بلحظة',
      image: 'assets/images/onboarding_3.svg',
    ),
  ];
}

class PassengerOnboardingScreen extends StatefulWidget {
  const PassengerOnboardingScreen({super.key});

  @override
  State<PassengerOnboardingScreen> createState() => _PassengerOnboardingScreenState();
}

class _PassengerOnboardingScreenState extends State<PassengerOnboardingScreen> {
  final PageController _pageController = PageController();
  final List<OnboardingData> _pages = OnboardingData.passengerPages;
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNext() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      context.go(AppRouteConstants.passengerLogin);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: _pages.length,
                itemBuilder: (context, index) => PassengerOnboardingPageView(data: _pages[index]),
              ),
            ),
            AppPageIndicator(controller: _pageController, count: _pages.length),
            const VerticalSpace(40),
            OnboardingNavigation(
              currentPage: _currentPage,
              totalPages: _pages.length,
              onNext: _onNext,
            ),
          ],
        ),
      ),
    );
  }
}












