import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:micromasr/core/app_radius.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/vertical_space.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250.ah,
      decoration: BoxDecoration(
        color: context.colors.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(AppRadius.pill.aw),
          bottomRight: Radius.circular(AppRadius.pill.aw),
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/Micro Masr App Icon.svg',
              width: 48.aw,
              height: 48.ah,
            ),
            const VerticalSpace(16),
            Text(
              'Micro Masr',
              style: context.headlineLargeTextStyle.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const VerticalSpace(8),
            Text(
              'مرحباً بيك! 👋',
              style: context.bodyLargeTextStyle.copyWith(
                color: context.colors.secondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}











