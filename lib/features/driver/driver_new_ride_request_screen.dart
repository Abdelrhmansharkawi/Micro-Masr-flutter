import 'package:flutter/material.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/features/driver/ride_request_card.dart';
import 'package:micromasr/features/driver/ride_request_timer.dart';

class DriverNewRideRequestScreen extends StatelessWidget {
  const DriverNewRideRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const darkBg = Color(0xFF101B15);
    const darkGreen = Color(0xFF4A7450);
    const orangeColor = Color(0xFFE28B5A);

    return Scaffold(
      backgroundColor: darkBg,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: AppSpacing.xl.ah),
              _HeaderSection(),
              SizedBox(height: AppSpacing.xxl.ah),
              const RideRequestTimer(value: 0.7, seconds: '١٢', orangeColor: orangeColor),
              SizedBox(height: AppSpacing.xxl.ah),
              const RideRequestCard(darkGreen: darkGreen, orangeColor: orangeColor),
              SizedBox(height: AppSpacing.xl.ah),
              _ActionFooter(orangeColor: orangeColor),
              SizedBox(height: AppSpacing.xl.ah),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.xl.aw),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('طلب رحلة جديد!', style: context.headlineMediumTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.w900)),
          SizedBox(height: 4.ah),
          Text('راكب بيحجز دلوقتي', style: context.titleMediumTextStyle.copyWith(color: Colors.lightGreen, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class _ActionFooter extends StatelessWidget {
  final Color orangeColor;
  const _ActionFooter({required this.orangeColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Text('رفض الرحلة', style: context.titleMediumTextStyle.copyWith(color: orangeColor, fontWeight: FontWeight.bold)),
        ),
        SizedBox(height: AppSpacing.md.ah),
        Text('سيتم تمرير الطلب تلقائياً إذا لم ترد', style: context.bodySmallTextStyle.copyWith(color: Colors.white.withValues(alpha: 0.5))),
      ],
    );
  }
}











