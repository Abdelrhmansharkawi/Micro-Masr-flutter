import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/app_route_constant.dart';
import 'package:micromasr/core/app_button.dart';
import 'package:micromasr/features/driver/pending_graphic_painter.dart';

class PendingVerificationScreen extends StatefulWidget {
  const PendingVerificationScreen({super.key});
  @override
  State<PendingVerificationScreen> createState() => _PendingVerificationScreenState();
}

class _PendingVerificationScreenState extends State<PendingVerificationScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() { super.initState(); _controller = AnimationController(vsync: this, duration: const Duration(seconds: 4))..repeat(reverse: true); }
  @override
  void dispose() { _controller.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.aw, vertical: AppSpacing.xxl.ah),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            const Spacer(),
            Center(child: AnimatedBuilder(animation: _controller, builder: (context, _) => CustomPaint(size: Size(200.aw, 200.aw), painter: PendingGraphicPainter(colorScheme: context.colors, progress: _controller.value)))),
            SizedBox(height: AppSpacing.xxl.ah),
            Text(AppStrings.pendingVerification, textAlign: TextAlign.center, style: context.headlineMediumTextStyle.copyWith(color: context.colors.onBackground, fontWeight: FontWeight.w800)),
            SizedBox(height: AppSpacing.sm.ah),
            Text(AppStrings.pendingVerificationBody, textAlign: TextAlign.center, style: context.bodyLargeTextStyle.copyWith(color: context.colors.textSecondary, height: 1.5)),
            const Spacer(),
            AppButton(label: 'الانتقال إلى الرئيسية (للتجربة)', onPressed: () => context.go(AppRouteConstants.driverHome), type: AppButtonType.primary),
            SizedBox(height: AppSpacing.md.ah),
            AppButton(label: 'تحديث الحالة', onPressed: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: const Text('البيانات قيد المراجعة حالياً...'), backgroundColor: context.colors.primary)), type: AppButtonType.secondary),
          ]),
        ),
      ),
    );
  }
}











