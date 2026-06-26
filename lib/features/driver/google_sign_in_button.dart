import 'package:flutter/material.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        backgroundColor: context.colors.surface,
        side: BorderSide(color: context.colors.outline),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        padding: EdgeInsets.symmetric(vertical: 14.ah),
        minimumSize: const Size(double.infinity, 0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const _GoogleLogo(size: 20),
          SizedBox(width: AppSpacing.sm.aw),
          Text(
            AppStrings.continueWithGoogle,
            style: context.bodyLargeTextStyle.copyWith(fontWeight: FontWeight.w600, color: context.colors.onSurface),
          ),
        ],
      ),
    );
  }
}

class _GoogleLogo extends StatelessWidget {
  const _GoogleLogo({required this.size});
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: size.aw, height: size.aw, child: CustomPaint(painter: _GoogleLogoPainter()));
  }
}

class _GoogleLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final r = size.width / 2;
    final colors = [const Color(0xFF4285F4), const Color(0xFF34A853), const Color(0xFFFBBC05), const Color(0xFFEA4335)];
    for (int i = 0; i < 4; i++) {
      final paint = Paint()..color = colors[i];
      canvas.drawArc(Rect.fromCircle(center: Offset(r, r), radius: r), (i * 90 - 90) * 3.14159 / 180, 90 * 3.14159 / 180, true, paint);
    }
    canvas.drawCircle(Offset(r, r), r * 0.55, Paint()..color = Colors.white);
  }
  @override
  bool shouldRepaint(covariant CustomPainter old) => false;
}

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});
  @override
  Widget build(BuildContext context) {
    final color = context.colors.outline;
    return Row(children: [
      Expanded(child: Divider(color: color)),
      Padding(padding: EdgeInsets.symmetric(horizontal: AppSpacing.md.aw), child: Text(AppStrings.orContinueWith, style: context.bodySmallTextStyle.copyWith(color: context.colors.textSecondary))),
      Expanded(child: Divider(color: color)),
    ]);
  }
}











