import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'onboarding_screen.dart';

class PassengerOnboardingPageView extends StatelessWidget {
  final OnboardingData data;

  const PassengerOnboardingPageView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.aw),
      child: Column(
        children: [
          Expanded(
            child: SvgPicture.asset(
              data.image,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 40.ah),
          Text(
            data.title,
            textAlign: TextAlign.center,
            style: context.displayLargeTextStyle.copyWith(
              color: context.colors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.ah),
          Text(
            data.subtitle,
            textAlign: TextAlign.center,
            style: context.bodyLargeTextStyle.copyWith(
              color: context.colors.onBackground.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }
}












