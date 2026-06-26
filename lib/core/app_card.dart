import 'package:flutter/material.dart';
import 'package:micromasr/core/app_radius.dart';
import 'package:micromasr/core/app_shadows.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.onTap,
    this.borderColor,
    this.borderRadius,
    this.color,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final effectiveBorderRadius = borderRadius ?? AppRadius.mdAll;
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: color ?? context.colors.surface,
        borderRadius: effectiveBorderRadius,
        border: borderColor != null ? Border.all(color: borderColor!) : null,
        boxShadow: AppShadows.shadowSm,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: effectiveBorderRadius,
          child: Padding(
            padding: padding ?? EdgeInsets.all(AppSpacing.md.aw),
            child: child,
          ),
        ),
      ),
    );
  }
}











