import 'package:flutter/material.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';

class ActiveTripBottomSheet extends StatelessWidget {
  final Color darkGreen, orangeColor;
  const ActiveTripBottomSheet({super.key, required this.darkGreen, required this.orangeColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: AppSpacing.md.ah, left: AppSpacing.lg.aw, right: AppSpacing.lg.aw,
        bottom: MediaQuery.of(context).padding.bottom + AppSpacing.lg.ah,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        boxShadow: [BoxShadow(color: Color(0x1A000000), blurRadius: 20, offset: Offset(0, -5))],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(width: 40.aw, height: 4.ah, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(2))),
          SizedBox(height: AppSpacing.xl.ah),
          _PassengerRow(darkGreen: darkGreen),
          SizedBox(height: AppSpacing.md.ah),
          Divider(color: Colors.grey[200]),
          SizedBox(height: AppSpacing.md.ah),
          _TripDetailsRow(darkGreen: darkGreen, orangeColor: orangeColor),
          SizedBox(height: AppSpacing.lg.ah),
          _SOSButton(),
          SizedBox(height: AppSpacing.xl.ah),
          _StartTripButton(orangeColor: orangeColor),
        ],
      ),
    );
  }
}

class _PassengerRow extends StatelessWidget {
  final Color darkGreen;
  const _PassengerRow({required this.darkGreen});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          _CircleIconBtn(icon: Icons.call, color: darkGreen),
          SizedBox(width: 12.aw),
          _CircleIconBtn(icon: Icons.chat_bubble_outline, color: darkGreen),
        ]),
        Row(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('محمد جلال', style: context.titleMediumTextStyle.copyWith(color: darkGreen, fontWeight: FontWeight.bold)),
              Text('مقعد ٣، ٤', style: context.bodyMediumTextStyle.copyWith(color: Colors.lightGreen, fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(width: 12.aw),
          _AvatarWithBadge(),
        ]),
      ],
    );
  }
}

class _CircleIconBtn extends StatelessWidget {
  final IconData icon;
  final Color color;
  const _CircleIconBtn({required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.aw),
      decoration: const BoxDecoration(color: Color(0xFFF2EFE8), shape: BoxShape.circle),
      child: Icon(icon, color: color, size: 20.aw),
    );
  }
}

class _AvatarWithBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(radius: 24.aw, backgroundColor: Colors.teal[700], child: Icon(Icons.person, color: Colors.white, size: 28.aw)),
        Container(
          width: 12.aw, height: 12.aw,
          decoration: BoxDecoration(color: Colors.lightGreen, shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 2)),
        ),
      ],
    );
  }
}

class _TripDetailsRow extends StatelessWidget {
  final Color darkGreen, orangeColor;
  const _TripDetailsRow({required this.darkGreen, required this.orangeColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('أرباح الرحلة', style: context.bodyMediumTextStyle.copyWith(color: context.colors.textSecondary)),
          Text('٣٢ جنيه', style: context.titleMediumTextStyle.copyWith(color: orangeColor, fontWeight: FontWeight.bold)),
        ]),
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text('يستناك في محطة مصر', style: context.titleMediumTextStyle.copyWith(color: darkGreen, fontWeight: FontWeight.bold)),
            Text('١.٢ كم', style: context.bodyMediumTextStyle.copyWith(color: context.colors.textSecondary)),
          ]),
          SizedBox(width: 8.aw),
          const Icon(Icons.location_on, color: Colors.lightGreen),
        ]),
      ],
    );
  }
}

class _SOSButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.aw, vertical: 8.ah),
      decoration: BoxDecoration(color: Colors.red.withValues(alpha: 0.05), borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.red.withValues(alpha: 0.2))),
      child: Text('SOS طوارئ', style: context.bodyMediumTextStyle.copyWith(color: Colors.red, fontWeight: FontWeight.bold)),
    );
  }
}

class _StartTripButton extends StatelessWidget {
  final Color orangeColor;
  const _StartTripButton({required this.orangeColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        width: double.infinity, padding: EdgeInsets.symmetric(vertical: 16.ah),
        decoration: BoxDecoration(color: orangeColor, borderRadius: BorderRadius.circular(32)),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('وصلت للراكب — ابدأ الرحلة', style: context.titleMediumTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
          SizedBox(width: 8.aw),
          const Icon(Icons.route, color: Colors.white),
        ]),
      ),
    );
  }
}











