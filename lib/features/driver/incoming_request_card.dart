import 'package:flutter/material.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/features/driver/driver_shared_widgets.dart';
import 'package:micromasr/features/driver/driver_new_ride_request_screen.dart';

class IncomingRequestCard extends StatelessWidget {
  const IncomingRequestCard({super.key});

  @override
  Widget build(BuildContext context) {
    final orangeColor = const Color(0xFFE28B5A);
    final darkGreen = const Color(0xFF4A7450);

    return DriverCard(
      boxShadow: [BoxShadow(color: orangeColor.withValues(alpha: 0.15), blurRadius: 12, offset: const Offset(0, 4))],
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _Badge(text: AppStrings.now),
              _RequestTitle(orangeColor: orangeColor),
            ],
          ),
          SizedBox(height: AppSpacing.sm.ah),
          Text('محطة مصر ← الجامعة ٠ ٣٢ جنيه ٠ ٢ مقاعد', textAlign: TextAlign.right, style: context.bodyMediumTextStyle.copyWith(color: darkGreen, fontWeight: FontWeight.w600)),
          SizedBox(height: AppSpacing.md.ah),
          _ViewRequestButton(orangeColor: orangeColor),
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String text;
  const _Badge({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.aw, vertical: 4.ah),
      decoration: BoxDecoration(color: context.colors.outline.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(12)),
      child: Text(text, style: context.bodySmallTextStyle.copyWith(fontWeight: FontWeight.bold, color: context.colors.onBackground)),
    );
  }
}

class _RequestTitle extends StatelessWidget {
  final Color orangeColor;
  const _RequestTitle({required this.orangeColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(AppStrings.newTripRequest, style: context.titleMediumTextStyle.copyWith(color: orangeColor, fontWeight: FontWeight.bold)),
        SizedBox(width: AppSpacing.xs.aw),
        Container(width: 8.aw, height: 8.aw, decoration: BoxDecoration(color: orangeColor, shape: BoxShape.circle)),
      ],
    );
  }
}

class _ViewRequestButton extends StatelessWidget {
  final Color orangeColor;
  const _ViewRequestButton({required this.orangeColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DriverNewRideRequestScreen())),
        style: ElevatedButton.styleFrom(
          backgroundColor: orangeColor, foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          padding: EdgeInsets.symmetric(vertical: 14.ah),
        ),
        child: Text(AppStrings.viewRequest, style: context.titleMediumTextStyle.copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
      ),
    );
  }
}











