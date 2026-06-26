import 'package:flutter/material.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';

class PassengerAuthDivider extends StatelessWidget {
  const PassengerAuthDivider({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: context.colors.outline,
            thickness: 1,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.aw),
          child: Text(
            text,
            style: context.bodyMediumTextStyle.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: context.colors.outline,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}











