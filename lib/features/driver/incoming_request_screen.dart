import 'package:flutter/material.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/app_button.dart';
import 'package:micromasr/features/driver/incoming_request_widgets.dart';

class IncomingRequestScreen extends StatelessWidget {
  const IncomingRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.scrim,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end, 
          children: [
            Container(
              decoration: BoxDecoration(
                color: context.colors.surface, 
                borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
              ),
              padding: EdgeInsets.all(AppSpacing.xl.aw),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch, 
                mainAxisSize: MainAxisSize.min, 
                children: [
                  const RequestHandle(),
                  SizedBox(height: AppSpacing.xl.ah),
                  Text(
                    AppStrings.passenger, 
                    style: context.titleLargeTextStyle.copyWith(color: context.colors.onSurface), 
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: AppSpacing.lg.ah),
                  const RequestTimer(),
                  SizedBox(height: AppSpacing.xl.ah),
                  const RequestFareCard(),
                  SizedBox(height: AppSpacing.xl.ah),
                  _buildActions(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActions(BuildContext context) {
    return Row(
      children: [
        Expanded(child: AppButton.secondary(label: AppStrings.decline, onPressed: () {})),
        SizedBox(width: AppSpacing.md.aw),
        Expanded(
          child: AppButton(
            label: AppStrings.accept, 
            onPressed: () {}, 
            type: AppButtonType.primary,
          ),
        ),
      ],
    );
  }
}












