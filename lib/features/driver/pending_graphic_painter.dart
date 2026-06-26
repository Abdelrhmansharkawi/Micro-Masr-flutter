import 'package:flutter/material.dart';
import 'package:micromasr/core/app_color_scheme.dart';

class PendingGraphicPainter extends CustomPainter {
  final AppColorScheme colorScheme;
  final double progress;
  PendingGraphicPainter({required this.colorScheme, required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(
      center,
      size.width * 0.45,
      Paint()
        ..color = colorScheme.primary.withValues(alpha: 0.1)
        ..style = PaintingStyle.fill,
    );
    final docRect = Rect.fromCenter(
      center: center,
      width: size.width * 0.5,
      height: size.height * 0.6,
    );
    final docRRect = RRect.fromRectAndRadius(docRect, const Radius.circular(12));
    canvas.drawRRect(
      docRRect.shift(const Offset(0, 8)),
      Paint()..color = colorScheme.outline.withValues(alpha: 0.2),
    );
    canvas.drawRRect(
      docRRect,
      Paint()
        ..color = colorScheme.surface
        ..style = PaintingStyle.fill,
    );
    canvas.drawRRect(
      docRRect,
      Paint()
        ..color = colorScheme.outline
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );
    final linePaint =
        Paint()
          ..color = colorScheme.outline
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round
          ..strokeWidth = 4;
    canvas.drawLine(
      Offset(center.dx - size.width * 0.15, center.dy - size.height * 0.15),
      Offset(center.dx + size.width * 0.15, center.dy - size.height * 0.15),
      linePaint,
    );
    canvas.drawLine(
      Offset(center.dx - size.width * 0.15, center.dy),
      Offset(center.dx + size.width * 0.15, center.dy),
      linePaint,
    );
    canvas.drawLine(
      Offset(center.dx - size.width * 0.15, center.dy + size.height * 0.15),
      Offset(center.dx, center.dy + size.height * 0.15),
      linePaint,
    );
    final scannerY = center.dy - size.height * 0.2 + (size.height * 0.4 * progress);
    canvas.drawLine(
      Offset(center.dx - size.width * 0.25, scannerY),
      Offset(center.dx + size.width * 0.25, scannerY),
      Paint()
        ..color = colorScheme.primary
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..strokeWidth = 3,
    );
    final path =
        Path()
          ..moveTo(center.dx - size.width * 0.25, scannerY)
          ..lineTo(center.dx + size.width * 0.25, scannerY)
          ..lineTo(center.dx + size.width * 0.3, scannerY + 20)
          ..lineTo(center.dx - size.width * 0.3, scannerY + 20)
          ..close();
    canvas.drawPath(
      path,
      Paint()
        ..color = colorScheme.primary.withValues(alpha: 0.3)
        ..style = PaintingStyle.fill,
    );
  }

  @override
  bool shouldRepaint(covariant PendingGraphicPainter oldDelegate) =>
      oldDelegate.progress != progress;
}











