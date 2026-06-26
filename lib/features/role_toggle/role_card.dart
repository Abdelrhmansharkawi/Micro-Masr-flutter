import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';

class RoleCard extends StatelessWidget {
  const RoleCard({
    required this.iconAsset,
    required this.title,
    required this.subtitle,
    required this.buttonLabel,
    required this.buttonColor,
    required this.onPressed,
    super.key,
  });

  final String iconAsset;
  final String title;
  final String subtitle;
  final String buttonLabel;
  final Color buttonColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.ar),
      ),
      child: Padding(
        padding: EdgeInsets.all(24.aw),
        child: Column(
          children: [
            // Icon container
            Container(
              width: 60.aw,
              height: 60.aw,
              decoration: BoxDecoration(
                color: context.colors.primaryContainer,
                borderRadius: BorderRadius.circular(12.ar),
              ),
              child: Center(
                child: SvgPicture.asset(
                  iconAsset,
                  width: 32.aw,
                  height: 32.aw,
                  colorFilter: ColorFilter.mode(
                    context.colors.primary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),

            SizedBox(height: 16.ah),

            // Title
            Text(
              title,
              style: context.titleLargeTextStyle.copyWith(
                color: context.colors.onSurface,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 8.ah),

            // Subtitle
            Text(
              subtitle,
              style: context.bodySmallTextStyle.copyWith(
                color: context.colors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 20.ah),

            // Button
            SizedBox(
              width: double.infinity,
              height: 48.ah,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.ar),
                  ),
                  elevation: 0,
                ),
                onPressed: onPressed,
                child: Text(
                  buttonLabel,
                  style: context.labelLargeTextStyle.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}











