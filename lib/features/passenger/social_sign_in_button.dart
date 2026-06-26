import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:micromasr/core/app_radius.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/horizontal_space.dart';

class SocialSignInButton extends StatelessWidget {
  const SocialSignInButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.iconPath = 'assets/icons/google_icon.svg',
  });

  final String label;
  final VoidCallback onPressed;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56.ah,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: context.colors.outline),
          shape: RoundedRectangleBorder(
            borderRadius: AppRadius.pillAll,
          ),
          backgroundColor: context.colors.surface,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: context.bodyLargeTextStyle.copyWith(
                fontWeight: FontWeight.bold,
                color: context.colors.onSurface,
              ),
            ),
            const HorizontalSpace(12),
            SvgPicture.asset(
              iconPath,
              width: 24.aw,
              height: 24.aw,
            ),
          ],
        ),
      ),
    );
  }
}
