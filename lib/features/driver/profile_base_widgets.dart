import 'package:flutter/material.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/features/driver/driver_shared_widgets.dart';

class ProfileHeader extends StatelessWidget {
  final String title;
  final Color darkGreen;
  const ProfileHeader({super.key, required this.title, required this.darkGreen});
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text('Micro Masr', style: context.titleMediumTextStyle.copyWith(color: darkGreen, fontWeight: FontWeight.w900)),
      Row(children: [Text(title, style: context.titleLargeTextStyle.copyWith(color: darkGreen, fontWeight: FontWeight.w800)), SizedBox(width: 16.aw), GestureDetector(onTap: () => Navigator.pop(context), child: Icon(Icons.arrow_forward_rounded, color: darkGreen))]),
    ]);
  }
}

class ProfileSectionHeader extends StatelessWidget {
  final String title;
  final Color darkGreen;
  const ProfileSectionHeader({super.key, required this.title, required this.darkGreen});
  @override
  Widget build(BuildContext context) {
    return Row(children: [Container(width: 4.aw, height: 20.ah, decoration: BoxDecoration(color: Colors.lightGreen, borderRadius: BorderRadius.circular(2))), SizedBox(width: 8.aw), Text(title, style: context.titleMediumTextStyle.copyWith(color: darkGreen, fontWeight: FontWeight.bold))]);
  }
}

class ProfileBaseSection extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const ProfileBaseSection({super.key, required this.title, required this.children});
  @override
  Widget build(BuildContext context) {
    return Column(children: [DriverSectionHeader(title: title), SizedBox(height: AppSpacing.md.ah), DriverCard(child: Column(children: children))]);
  }
}

class ProfileListTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Color? subtitleColor;
  final IconData icon;
  final Color darkGreen;
  final Color? iconColor;
  final Widget? trailing;
  final VoidCallback? onTap;

  const ProfileListTile({super.key, required this.title, this.subtitle, this.subtitleColor, required this.icon, required this.darkGreen, this.iconColor, this.trailing, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap, contentPadding: EdgeInsets.zero,
      leading: Container(padding: EdgeInsets.all(10.aw), decoration: const BoxDecoration(color: Color(0xFFF2EFE8), shape: BoxShape.circle), child: Icon(icon, color: iconColor ?? darkGreen, size: 20.aw)),
      trailing: trailing ?? Icon(Icons.arrow_back_ios_new_rounded, size: 16.aw, color: context.colors.textSecondary.withValues(alpha: 0.5)),
      title: Text(title, style: context.titleMediumTextStyle.copyWith(color: darkGreen, fontWeight: FontWeight.w600)),
      subtitle: subtitle != null ? Text(subtitle!, style: context.bodySmallTextStyle.copyWith(color: subtitleColor ?? context.colors.textSecondary, fontWeight: subtitleColor != null ? FontWeight.bold : FontWeight.normal)) : null,
    );
  }
}











