import 'package:flutter/material.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/app_card.dart';

class FAQItemTile extends StatelessWidget {
  final String question;
  final String answer;

  const FAQItemTile({
    super.key,
    required this.question,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      margin: EdgeInsets.only(bottom: 12.ah),
      padding: EdgeInsets.zero,
      child: ExpansionTile(
        shape: const RoundedRectangleBorder(side: BorderSide.none),
        title: Text(
          question,
          style: context.titleSmallTextStyle.copyWith(fontWeight: FontWeight.bold, color: context.colors.primary),
          textAlign: TextAlign.end,
        ),
        iconColor: context.colors.primary,
        collapsedIconColor: context.colors.textSecondary,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16.aw, 0, 16.aw, 16.ah),
            child: Text(
              answer,
              style: context.bodyMediumTextStyle.copyWith(color: context.colors.textSecondary, height: 1.5),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}











