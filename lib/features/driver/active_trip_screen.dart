import 'package:flutter/material.dart';
import 'package:micromasr/core/app_spacing.dart';
import 'package:micromasr/core/app_strings.dart';
import 'package:micromasr/core/context_extensions.dart';
import 'package:micromasr/core/size_extensions.dart';
import 'package:micromasr/core/app_button.dart';
import 'package:micromasr/core/app_card.dart';

class ActiveTripScreen extends StatefulWidget {
  const ActiveTripScreen({super.key});

  @override
  State<ActiveTripScreen> createState() => _ActiveTripScreenState();
}

class _ActiveTripScreenState extends State<ActiveTripScreen> {
  String _status = "pickup"; // pickup, inProgress, completed
  bool _isCompleted = false;

  final _dummyTrip = {
    'passengerName': 'محمد علي',
    'fare': 45.0,
    'pickupLocation': 'المعادي - شارع ٩',
    'dropoffLocation': 'التحرير - وسط البلد',
  };

  void _handleStatusUpdate() {
    setState(() {
      if (_status == "pickup") {
        _status = "inProgress";
      } else if (_status == "inProgress") {
        _status = "completed";
        _isCompleted = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: AppBar(
        backgroundColor: context.colors.surface,
        elevation: 0,
        title: Text(
          AppStrings.activeTrip,
          style: context.headlineMediumTextStyle.copyWith(
            color: context.colors.onSurface,
          ),
        ),
      ),
      body: _isCompleted 
        ? Center(
            child: Text(
              AppStrings.bookingConfirmed,
              style: context.headlineMediumTextStyle.copyWith(color: context.colors.primary),
            ),
          )
        : _buildActiveTripUI(context),
    );
  }

  Widget _buildActiveTripUI(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            color: context.colors.primaryContainer,
            child: Center(
              child: Icon(
                Icons.map_outlined,
                size: 100.aw,
                color: context.colors.primary.withValues(alpha: 0.3),
              ),
            ),
          ),
        ),
        Positioned(
          left: AppSpacing.md.aw,
          right: AppSpacing.md.aw,
          bottom: AppSpacing.xl.ah,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FloatingActionButton(
                    heroTag: 'call',
                    onPressed: () {},
                    backgroundColor: context.colors.surface,
                    foregroundColor: context.colors.primary,
                    child: const Icon(Icons.call),
                  ),
                  SizedBox(width: AppSpacing.sm.aw),
                  FloatingActionButton(
                    heroTag: 'chat',
                    onPressed: () {},
                    backgroundColor: context.colors.surface,
                    foregroundColor: context.colors.primary,
                    child: const Icon(Icons.chat_bubble_outline),
                  ),
                ],
              ),
              SizedBox(height: AppSpacing.md.ah),
              AppCard(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _dummyTrip['passengerName'] as String,
                          style: context.titleLargeTextStyle.copyWith(
                            color: context.colors.onSurface,
                          ),
                        ),
                        Text(
                          '${_dummyTrip['fare']} ${AppStrings.cash}',
                          style: context.titleMediumTextStyle.copyWith(
                            color: context.colors.primary,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSpacing.sm.ah),
                    Text(
                      _status == "pickup" 
                          ? _dummyTrip['pickupLocation'] as String 
                          : _dummyTrip['dropoffLocation'] as String,
                      style: context.bodyLargeTextStyle.copyWith(
                        color: context.colors.textSecondary,
                      ),
                    ),
                    SizedBox(height: AppSpacing.lg.ah),
                    AppButton(
                      label: _status == "pickup"
                          ? AppStrings.start
                          : AppStrings.completeTrip,
                      onPressed: _handleStatusUpdate,
                      type: AppButtonType.primary,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}












