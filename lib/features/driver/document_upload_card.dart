import 'package:flutter/material.dart';
import 'package:micromasr/core/app_radius.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/features/driver/document_card_variants.dart';

class DocumentUploadCard extends StatelessWidget {
  const DocumentUploadCard({super.key, required this.icon, required this.title, this.subtitle, required this.isUploaded, required this.onTap});
  final IconData icon;
  final String title;
  final String? subtitle;
  final bool isUploaded;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.md.aw, vertical: AppSpacing.md.ah),
        decoration: BoxDecoration(
          color: isUploaded ? context.colors.primaryContainer : context.colors.surface,
          borderRadius: AppRadius.lgAll,
          border: Border.all(color: isUploaded ? context.colors.primary : context.colors.outline, width: isUploaded ? 1.5.aw : 1.aw),
        ),
        child: isUploaded
            ? UploadedRow(icon: icon, title: title, subtitle: subtitle)
            : EmptyColumn(icon: icon, title: title, subtitle: subtitle),
      ),
    );
  }
}











