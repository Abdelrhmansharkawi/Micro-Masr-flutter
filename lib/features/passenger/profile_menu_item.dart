import 'package:flutter/material.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? subtitle;
  final VoidCallback? onTap;
  final bool showDivider;
  final Color? iconColor;
  final Widget? trailing;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.label,
    this.subtitle,
    this.onTap,
    this.showDivider = true,
    this.iconColor,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: (iconColor ?? context.colors.primary).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: iconColor ?? context.colors.primary,
              size: 20.aw,
            ),
          ),
          title: Text(
            label,
            style: context.titleSmallTextStyle.copyWith(
              fontWeight: FontWeight.bold,
              color: context.colors.primary,
            ),
          ),
          subtitle: subtitle != null
              ? Text(
                  subtitle!,
                  style: context.bodySmallTextStyle.copyWith(color: context.colors.textSecondary),
                )
              : null,
          trailing: trailing ?? Icon(
            Icons.arrow_forward_ios_rounded,
            size: 16.aw,
            color: context.colors.textSecondary.withValues(alpha: 0.5),
          ),
        ),
        if (showDivider)
          Padding(
            padding: EdgeInsetsDirectional.only(start: 56.aw, end: 16.aw),
            child: Divider(
              height: 1,
              color: context.colors.outline.withValues(alpha: 0.1),
            ),
          ),
      ],
    );
  }
}











