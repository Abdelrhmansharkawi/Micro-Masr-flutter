import 'package:flutter/material.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';

class TripHistoryCard extends StatelessWidget {
  final String time, status, origin, destination, passengerName, rating, seats, price;
  final bool isCompleted;

  const TripHistoryCard({
    super.key, required this.time, required this.status, required this.origin, required this.destination,
    required this.passengerName, required this.rating, required this.seats, required this.price, required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    const darkGreen = Color(0xFF4A7450);
    const orangeColor = Color(0xFFE28B5A);
    final greyColor = context.colors.textSecondary;

    return Container(
      padding: EdgeInsets.all(AppSpacing.md.aw),
      decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(24),
        border: Border(right: BorderSide(color: isCompleted ? Colors.lightGreen : orangeColor.withValues(alpha: 0.3), width: 4)),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        _Header(time: time, status: status, isCompleted: isCompleted, darkGreen: darkGreen, orangeColor: orangeColor),
        SizedBox(height: AppSpacing.md.ah),
        _Timeline(origin: origin, destination: destination, isCompleted: isCompleted, greyColor: greyColor, orangeColor: orangeColor, darkGreen: darkGreen),
        Divider(color: context.colors.outline.withValues(alpha: 0.2), height: 32.ah),
        _Footer(passengerName: passengerName, rating: rating, seats: seats, price: price, isCompleted: isCompleted, darkGreen: darkGreen, orangeColor: orangeColor, greyColor: greyColor),
      ]),
    );
  }
}

class _Header extends StatelessWidget {
  final String time, status;
  final bool isCompleted;
  final Color darkGreen, orangeColor;
  const _Header({required this.time, required this.status, required this.isCompleted, required this.darkGreen, required this.orangeColor});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 12.aw, vertical: 4.ah),
        decoration: BoxDecoration(color: isCompleted ? Colors.lightGreen.withValues(alpha: 0.2) : orangeColor.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(12)),
        child: Text(status, style: context.bodySmallTextStyle.copyWith(color: isCompleted ? darkGreen : orangeColor, fontWeight: FontWeight.bold)),
      ),
      Text(time, style: context.titleMediumTextStyle.copyWith(color: darkGreen, fontWeight: FontWeight.w800)),
    ]);
  }
}

class _Timeline extends StatelessWidget {
  final String origin, destination;
  final bool isCompleted;
  final Color greyColor, orangeColor, darkGreen;
  const _Timeline({required this.origin, required this.destination, required this.isCompleted, required this.greyColor, required this.orangeColor, required this.darkGreen});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.end, crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Text(origin, style: context.bodyMediumTextStyle.copyWith(color: darkGreen, fontWeight: FontWeight.bold)),
        SizedBox(height: 16.ah),
        Text(destination, style: context.bodyMediumTextStyle.copyWith(color: darkGreen, fontWeight: FontWeight.bold)),
      ])),
      SizedBox(width: AppSpacing.sm.aw),
      Column(children: [
        Container(width: 12.aw, height: 12.aw, decoration: BoxDecoration(color: isCompleted ? Colors.lightGreen : greyColor, shape: BoxShape.circle)),
        Container(width: 2.aw, height: 24.ah, color: context.colors.outline.withValues(alpha: 0.3)),
        Container(width: 12.aw, height: 12.aw, decoration: BoxDecoration(color: isCompleted ? orangeColor : greyColor, borderRadius: BorderRadius.circular(2))),
      ]),
    ]);
  }
}

class _Footer extends StatelessWidget {
  final String passengerName, rating, seats, price;
  final bool isCompleted;
  final Color darkGreen, orangeColor, greyColor;
  const _Footer({required this.passengerName, required this.rating, required this.seats, required this.price, required this.isCompleted, required this.darkGreen, required this.orangeColor, required this.greyColor});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (seats.isNotEmpty) Container(padding: EdgeInsets.symmetric(horizontal: 8.aw, vertical: 2.ah), decoration: BoxDecoration(color: const Color(0xFFF2EFE8), borderRadius: BorderRadius.circular(8)), child: Text(seats, style: context.bodySmallTextStyle.copyWith(color: darkGreen, fontSize: 10, fontWeight: FontWeight.bold))),
        SizedBox(height: 4.ah),
        Row(children: [Text(' جنيه', style: context.bodySmallTextStyle.copyWith(color: isCompleted ? orangeColor : greyColor, fontWeight: FontWeight.bold)), Text(price, style: context.titleMediumTextStyle.copyWith(color: isCompleted ? orangeColor : greyColor, fontWeight: FontWeight.w800))]),
      ]),
      Row(children: [
        Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Text(passengerName, style: context.bodyMediumTextStyle.copyWith(color: darkGreen, fontWeight: FontWeight.bold)),
          if (rating.isNotEmpty) Text(rating, style: context.bodySmallTextStyle.copyWith(color: orangeColor, fontSize: 10, fontWeight: FontWeight.w600)),
        ]),
        SizedBox(width: AppSpacing.sm.aw),
        CircleAvatar(radius: 16.aw, backgroundColor: context.colors.primaryContainer, child: Icon(Icons.person, size: 20.aw, color: darkGreen)),
      ]),
    ]);
  }
}











